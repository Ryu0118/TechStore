//
//  RSSReaderImpl.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Dependencies
import Domain
import Foundation

extension RSSReader: DependencyKey {
    public static var liveValue: RSSReader = .init { url in
        let request = RssToJsonRequest(rssUrl: url)
        let session = request.buildURLSession()
        let client = APIClient(urlSession: session)
        let data = try await client.send(request)
        var response = try JSONDecoder().decode(RSSResponse.self, from: data)

        let items = response.items
        let ogpRelation = try await associateItemAndOGPData(items: items)

        let modifiedItem = assignThumbnailIfNeeded(items: items, relation: ogpRelation)
        response.items = modifiedItem

        return response
    }

    private static func associateItemAndOGPData(
        items: [RSSResponse.Item]
    ) async throws -> [RSSResponse.Item: OGPData] { // thumbnailがないItemのみOGPDataを取得しItemとOGPDataを関連づける
        var ogpRelation = [RSSResponse.Item: OGPData]()

        try await withThrowingTaskGroup(of: (RSSResponse.Item, OGPData).self) { group in
            let ogpFetcher = OGPFetcher()

            for item in items {
                if item.enclosure.link?.isEmpty ?? true,
                   item.thumbnail.isEmpty
                { // 記事のOGP画像がRSSから取得できない場合は手動で取得する。
                    group.addTask {
                        try await (item, ogpFetcher.fetchData(from: item.link))
                    }
                }
            }

            for try await (item, ogpData) in group {
                ogpRelation.updateValue(ogpData, forKey: item)
            }
        }

        return ogpRelation
    }

    private static func assignThumbnailIfNeeded(
        items: [RSSResponse.Item],
        relation: [RSSResponse.Item: OGPData]
    ) -> [RSSResponse.Item] { // thumbnailがないItemのみOGPDataが結びついているならばOGP画像を代わりに代入
        items.map { item in
            var copy = item

            if let ogpData = relation[item],
               let thumbnail = ogpData.imageURL?.absoluteString
            {
                copy.thumbnail = thumbnail
            }

            return copy
        }
    }
}

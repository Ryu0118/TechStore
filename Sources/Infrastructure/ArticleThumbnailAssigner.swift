//
//  ArticleThumbnailAssigner.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import Domain
import Foundation

struct ArticleThumbnailAssigner {
    func assignThumbnailIfNeeded(
        articles: [Article]
    ) async throws -> [Article] {
        let relation = try await associateArticleAndOGPData(articles: articles)
        return assignThumbnailIfNeeded(articles: articles, relation: relation)
    }

    private func associateArticleAndOGPData(
        articles: [Article]
    ) async throws -> [Article: OGPData] {
        var relation = [Article: OGPData]()

        try await withThrowingTaskGroup(of: (Article, OGPData).self) { group in
            let ogpFetcher = OGPFetcher()

            for article in articles where article.thumbnailUrl == nil {
                group.addTask {
                    try await (article, ogpFetcher.fetchData(from: article.linkUrl.absoluteString))
                }
            }

            for try await (article, ogpData) in group {
                relation.updateValue(ogpData, forKey: article)
            }
        }

        return relation
    }

    private func assignThumbnailIfNeeded(
        articles: [Article],
        relation: [Article: OGPData]
    ) -> [Article] { // thumbnailがないArticleのみOGPDataが結びついているならばOGP画像を代わりに代入
        articles.map { article in
            var copy = article

            if let ogpData = relation[article],
               let thumbnail = ogpData.imageURL
            {
                copy.thumbnailUrl = thumbnail
            }

            return copy
        }
    }
}

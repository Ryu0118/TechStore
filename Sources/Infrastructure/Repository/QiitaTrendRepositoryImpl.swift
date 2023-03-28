//
//  QiitaTrendRepositoryImpl.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Dependencies
import Domain
import Foundation

extension QiitaTrendRepository: DependencyKey {
    @Dependency(\.rssReader.readFeed) static var readFeed

    public static let liveValue: QiitaTrendRepository = .init {
        let rssUrl = "https://qiita.com/popular-items/feed"
        let rss = try await readFeed(rssUrl)

        return rss
    }
}

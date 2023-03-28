//
//  ZennTrendRepositoryImpl.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Dependencies
import Domain
import Foundation

extension ZennTrendRepository: DependencyKey {
    @Dependency(\.rssReader.readFeed) static var readFeed

    public static let liveValue: ZennTrendRepository = .init {
        let rssUrl = "https://zenn.dev/feed"
        let rss = try await readFeed(rssUrl)

        return rss
    }
}

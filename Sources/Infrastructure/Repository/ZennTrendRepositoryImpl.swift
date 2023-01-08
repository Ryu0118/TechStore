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
    @Dependency(\.rssReader.readRss) static var readRss

    public static let liveValue: ZennTrendRepository = .init {
        let rssUrl = "https://zenn.dev/feed"
        let rss = try await readRss(rssUrl)

        return rss
    }
}

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
    @Dependency(\.rssReader.readRss) static var readRss

    public static let liveValue: QiitaTrendRepository = .init {
        let rssUrl = "https://qiita.com/popular-items/feed"
        let rss = try await readRss(rssUrl)

        return rss
    }
}

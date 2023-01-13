// 
//  HomeUseCaseImpl.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import Foundation
import Dependencies
import Domain
import struct SwiftUI.AppStorage

extension HomeUseCase: DependencyKey {
    @Dependency(\.rssReader.readFeed) static var readFeed
    @Storage("userFeeds", register: UserFeed.default()) static var userFeeds
    
    static public var liveValue: HomeUseCase = .init {
        var relation = [UserFeed: HomeSection]()
        var sections = [HomeSection]()
        
        try await withThrowingTaskGroup(of: (UserFeed, [Article]).self) { group in
            for userFeed in userFeeds {
                group.addTask {
                    try await (userFeed, readFeed(userFeed.feedUrl.absoluteString))
                }
            }
            
            for try await (feed, articles) in group {
                relation.updateValue(
                    .init(sectionTitle: feed.title, articles: articles),
                    forKey: feed
                )
            }
        }
        
        for userFeed in userFeeds { //sort
            guard let section = relation[userFeed] else {
                continue
            }
            sections.append(section)
        }
        
        return sections
    }
}

extension UserFeed {
    static func `default`() -> [Self] {
        [
            .init(feedUrl: URL(string: "https://qiita.com/popular-items/feed")!, title: "Qiitaのトレンド"),
            .init(feedUrl: URL(string: "https://zenn.dev/feed")!, title: "Zennのトレンド")
        ]
    }
}

public struct UserFeed: Codable, Hashable {
    public let feedUrl: URL
    public let title: String
    
    public init(feedUrl: URL, title: String) {
        self.feedUrl = feedUrl
        self.title = title
    }
}



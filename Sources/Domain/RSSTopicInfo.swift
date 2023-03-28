//
//  RSSTopicInfo.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/11.
//

import Foundation

public struct RSSTopicInfo {
    public let rssUrl: String
    /// examples
    /// https://zenn.dev/topics/__TOPIC__/feed
    /// https://qiita.com/tags/__TOPIC__/feed
    /// https://tech.uzabase.com/feed/category/__TOPIC__
    /// https://tech.mirrativ.stream/feed/category/__TOPIC__
    /// https://developers.cyberagent.co.jp/blog/archives/category/__TOPIC__/feed/
    /// https://techblog.zozo.com/rss/category/__TOPIC__
    /// https://labs.gree.jp/blog/tag/__TOPIC__/feed/
    /// https://nitter.net/__TOPIC__/rss
    public let topicUrl: String

    public init(rssUrl: String, topicUrl: String) {
        self.rssUrl = rssUrl
        self.topicUrl = topicUrl
    }
}

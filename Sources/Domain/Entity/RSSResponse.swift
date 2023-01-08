//
//  RSSResponse.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation

public struct RSSResponse: Decodable {
    public let feed: Feed
    public var items: [Item]
}

public extension RSSResponse {
    struct Feed: Decodable {
        public let url: String
        public let title: String
        public let link: String
        public let description: String
        public let image: String
    }
}

public extension RSSResponse {
    struct Item: Decodable, Hashable {
        public let title: String
        public let pubDate: String
        public let link: String
        public var thumbnail: String
        public let author: String
        public let description: String
        public let enclosure: Enclosure
        public let categories: [String]
    }
}

public extension RSSResponse.Item {
    struct Enclosure: Decodable, Hashable {
        public let link: String?
    }
}

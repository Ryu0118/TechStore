//
//  RSSResponse.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation

public struct RSSResponse: Decodable {
    public let feed: Feed
    public let items: [Item]
}

public extension RSSResponse {
    struct Feed: Decodable {
        let url: String
        let title: String
        let link: String
        let description: String
        let image: String
    }
}

public extension RSSResponse {
    struct Item: Decodable {
        let title: String
        let pubDate: String
        let author: String
        let description: String
        let enclosure: Enclosure
        let categories: [String]
    }
}

public extension RSSResponse.Item {
    struct Enclosure: Decodable {
        let link: String
    }
}

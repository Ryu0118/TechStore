// 
//  UserFeed.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/14.
//

import Foundation

public struct UserFeed: Codable, Hashable {
    public let feedUrl: URL
    public let title: String
    
    public init(feedUrl: URL, title: String) {
        self.feedUrl = feedUrl
        self.title = title
    }
}

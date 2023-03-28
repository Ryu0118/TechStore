//
//  Article.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/09.
//

import Foundation

public struct Article: Hashable {
    public let title: String
    public let description: String
    public let updatedAt: Date
    public let linkUrl: URL
    public var thumbnailUrl: URL?

    public init(title: String, description: String, updatedAt: Date, linkUrl: URL, thumbnailUrl: URL? = nil) {
        self.title = title
        self.description = description
        self.updatedAt = updatedAt
        self.linkUrl = linkUrl
        self.thumbnailUrl = thumbnailUrl
    }
}

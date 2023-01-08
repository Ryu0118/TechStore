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
    public let link: String
    public let thumbnail: String

    public init(title: String, description: String, link: String, thumbnail: String) {
        self.title = title
        self.description = description
        self.link = link
        self.thumbnail = thumbnail
    }
}

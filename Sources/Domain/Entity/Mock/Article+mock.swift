// 
//  Article+mock.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import Foundation

public extension Article {
    static public func mock() -> Self {
        Article(
            title: "SwiftUIでSwiftUIを作る画期的方法",
            description: "",
            updatedAt: Date(),
            linkUrl: URL(string: "https://github.com")!,
            thumbnailUrl: URL(string: "https://github.com/Ryu0118.png")
        )
    }
}

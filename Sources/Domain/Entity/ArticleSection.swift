// 
//  ArticleSection.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import Foundation

public struct ArticleSection {
    public let sectionTitle: String
    public let articles: [Article]
    
    public init(sectionTitle: String, articles: [Article]) {
        self.sectionTitle = sectionTitle
        self.articles = articles
    }
}

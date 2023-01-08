// 
//  ArticleRepository.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/09.
//

import Foundation
import XCTestDynamicOverlay
import Dependencies

public struct ArticleRepository {
    public var searchArticle: (_ query: String) async throws -> Article
    
    public init(searchArticle: @escaping (_: String) async throws -> Article) {
        self.searchArticle = searchArticle
    }
}

extension ArticleRepository: TestDependencyKey {
    static public var testValue: ArticleRepository = .init(searchArticle: unimplemented("ArticleRepository.searchArticle"))
}

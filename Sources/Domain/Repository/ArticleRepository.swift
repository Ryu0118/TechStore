//
//  ArticleRepository.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/09.
//

import Dependencies
import Foundation
import XCTestDynamicOverlay

public struct ArticleRepository {
    public var searchArticle: (SearchArticleArgument) async throws -> [Article]

    public init(searchArticle: @escaping (SearchArticleArgument) async throws -> [Article]) {
        self.searchArticle = searchArticle
    }
}

public extension ArticleRepository {
    struct SearchArticleArgument {
        public let query: String
        public let page: Int
        public let perPage: Int

        public init(query: String, page: Int, perPage: Int) {
            self.query = query
            self.page = page
            self.perPage = perPage
        }
    }
}

extension ArticleRepository: TestDependencyKey {
    public static var testValue: ArticleRepository = .init(searchArticle: unimplemented("ArticleRepository.searchArticle"))
}

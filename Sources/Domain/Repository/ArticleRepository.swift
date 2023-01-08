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
    public var searchArticle: (_ query: String, _ page: Int, _ perPage: Int) async throws -> [Article]

    public init(searchArticle: @escaping (_ query: String, _ page: Int, _ perPage: Int) async throws -> [Article]) {
        self.searchArticle = searchArticle
    }
}

extension ArticleRepository: TestDependencyKey {
    public static var testValue: ArticleRepository = .init(searchArticle: unimplemented("ArticleRepository.searchArticle"))
}

//
//  ArticleRepositoryImpl.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/09.
//

import Dependencies
import Domain
import Foundation

extension ArticleRepository: DependencyKey {
    public static var liveValue: ArticleRepository = .init { argument in
        let request = QiitaSearchArticleRequest(page: argument.page, perPage: argument.perPage, query: argument.query)
        let urlSession = request.buildURLSession()
        let client = APIClient(urlSession: urlSession)
        let data = try await client.send(request)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let response = try decoder.decode([QiitaAPIResponse].self, from: data)

        let converter = ArticleThumbnailAssigner()
        let articles = response.map {
            Article(title: $0.title, description: $0.title, updatedAt: $0.updated_at, linkUrl: URL(string: $0.url)!)
        }

        let converted = try await converter.assignThumbnailIfNeeded(articles: articles)

        return converted
    }
}

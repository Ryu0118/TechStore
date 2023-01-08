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
    public static var liveValue: ArticleRepository = .init { (query: String, page: Int, perPage: Int) in
        let request = QiitaSearchArticleRequest(page: page, perPage: perPage, query: query)
        let urlSession = request.buildURLSession()
        let client = APIClient(urlSession: urlSession)
        let data = try await client.send(request)
        let response = try JSONDecoder().decode([QiitaAPIResponse].self, from: data)

        return response.map {
            Article(title: $0.title, description: $0.title, link: $0.url, thumbnail: "")
        }
    }
}

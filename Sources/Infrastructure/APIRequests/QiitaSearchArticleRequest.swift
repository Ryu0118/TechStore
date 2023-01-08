//
//  QiitaSearchArticleRequest.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/09.
//

import Domain
import Foundation

struct QiitaSearchArticleRequest {
    let page: Int
    let perPage: Int
    let query: String

    init(page: Int, perPage: Int, query: String) {
        self.page = page
        self.perPage = perPage
        self.query = "body:" + query
    }
}

extension QiitaSearchArticleRequest: APIRequest {
    var apiUrl: String {
        "https://qiita.com"
    }

    var path: String {
        "api/v2/items"
    }

    var method: Domain.HTTPMethod {
        .get
    }

    var queryItems: [URLQueryItem] {
        [
            .init(name: "page", value: "\(page)"),
            .init(name: "per_page", value: "\(perPage)"),
            .init(name: "query", value: query),
        ]
    }

    var httpHeaders: [String: String] {
        let token = KeyManager.shared.getValue(key: .qiitaToken)
        return [
            "Authorization": "Bearer \(token)",
        ]
    }
}

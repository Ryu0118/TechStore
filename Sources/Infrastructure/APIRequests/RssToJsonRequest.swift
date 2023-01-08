//
//  RssToJsonRequest.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Domain
import Foundation

struct RssToJsonRequest {
    private let rssUrl: String

    init(rssUrl: String) {
        self.rssUrl = rssUrl
    }
}

extension RssToJsonRequest: APIRequest {
    var apiUrl: String {
        "https://api.rss2json.com"
    }

    var path: String {
        "v1/api.json"
    }

    var method: Domain.HTTPMethod {
        .get
    }

    var queryItems: [URLQueryItem] {
        [
            .init(name: "rss_url", value: rssUrl),
        ]
    }

    var httpHeaders: [String: String] { [:] }
}

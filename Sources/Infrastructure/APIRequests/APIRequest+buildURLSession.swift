//
//  APIRequest+buildURLSession.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/09.
//

import Domain
import Foundation

extension APIRequest {
    func buildURLSession() -> URLSession {
        guard !httpHeaders.isEmpty else {
            return URLSession.shared
        }

        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.httpAdditionalHeaders = httpHeaders
        sessionConfig.requestCachePolicy = .returnCacheDataElseLoad

        return URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
    }
}

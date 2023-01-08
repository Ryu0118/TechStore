// 
//  APIRequest+buildURLSession.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/09.
//

import Foundation
import Domain

extension APIRequest {
    func buildURLSession() -> URLSession {
        guard !httpHeaders.isEmpty else {
            return URLSession.shared
        }

        var sessionConfig = URLSessionConfiguration.default
        sessionConfig.httpAdditionalHeaders = httpHeaders
        
        return URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
    }
}

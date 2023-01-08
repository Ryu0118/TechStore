// 
//  APIClient.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation
import Domain

struct APIClient {
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
}

extension APIClient {
    func send<Request: APIRequest>(_ request: Request) async throws -> Data {
        guard let urlRequest = request.buildRequest() else {
            throw APIClientError.invalidRequest
        }
        let (data, _) = try await urlSession.data(for: urlRequest)
        return data
    }
}

enum APIClientError: LocalizedError {
    case invalidRequest
    
    var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return "invalid request: Failed to build request"
        }
    }
}

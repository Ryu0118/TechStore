//
//  APIRequest.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
}

public protocol APIRequest {
    var apiUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
    var httpHeaders: [String: String] { get }
}

public extension APIRequest {
    func buildRequest() -> URLRequest? {
        var urlComponents = URLComponents(string: apiUrl)
        urlComponents?.queryItems = queryItems

        guard var url = urlComponents?.url else {
            return nil
        }

        url = url.appendingPathComponent(path)

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        return request
    }
}

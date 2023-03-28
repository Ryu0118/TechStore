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

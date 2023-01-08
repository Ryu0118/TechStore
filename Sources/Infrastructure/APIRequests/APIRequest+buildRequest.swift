//
//  APIRequest+buildRequest.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/09.
//

import Foundation

extension APIRequest {
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

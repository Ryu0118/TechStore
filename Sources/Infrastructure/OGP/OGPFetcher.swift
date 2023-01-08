//
//  OGPFetcher.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation

struct OGPFetcher {
    func fetchData(from urlString: String) async throws -> OGPData {
        guard let url = URL(string: urlString) else {
            throw OGPFetcherError.invalidURL
        }

        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)

        guard let htmlString = String(data: data, encoding: .utf8) else {
            throw OGPFetcherError.failedToEncode
        }

        let translator = OGPTranslator()
        let ogpData = try translator.getOGPData(from: htmlString)

        return ogpData
    }
}

enum OGPFetcherError: Error {
    case invalidURL
    case failedToEncode
}

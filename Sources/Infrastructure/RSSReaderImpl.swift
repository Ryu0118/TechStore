// 
//  RSSReaderImpl.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation
import Domain
import Dependencies

extension RSSReader: DependencyKey {
    static public var liveValue: RSSReader = .init { url in
        let client = APIClient(urlSession: .shared)
        let request = RssToJsonRequest(rssUrl: url)
        let data = try await client.send(request)
        
        return try JSONDecoder().decode(RSSResponse.self, from: data)
    }
}

// 
//  QiitaTrendRepository.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation
import Dependencies
import XCTestDynamicOverlay

public struct QiitaTrendRepository: TrendRepository {
    public var fetchTrend: () async throws -> RSSResponse
    
    public init(fetchTrend: @escaping () async throws -> RSSResponse) {
        self.fetchTrend = fetchTrend
    }
}

extension QiitaTrendRepository: TestDependencyKey {
    static public var testValue: QiitaTrendRepository = .init(fetchTrend: unimplemented("QiitaTrendRepository.fetchTrend"))
}

// 
//  ZennTrendRepository.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation
import XCTestDynamicOverlay
import Dependencies

public struct ZennTrendRepository: TrendRepository {
    public var fetchTrend: () async throws -> RSSResponse
    
    public init(fetchTrend: @escaping () async throws -> RSSResponse) {
        self.fetchTrend = fetchTrend
    }
}

extension ZennTrendRepository: TestDependencyKey {
    static public var testValue: ZennTrendRepository = .init(fetchTrend: unimplemented("QiitaTrendRepository.fetchTrend"))
}

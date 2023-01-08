// 
//  ZennTrendRepository.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation
import XCTestDynamicOverlay
import Dependencies

struct ZennTrendRepository: TrendRepository {
    var fetchTrend: () async throws -> RSSResponse
}

extension ZennTrendRepository: TestDependencyKey {
    static public var testValue: ZennTrendRepository = .init(fetchTrend: unimplemented("QiitaTrendRepository.fetchTrend"))
}

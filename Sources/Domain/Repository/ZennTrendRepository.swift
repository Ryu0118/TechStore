//
//  ZennTrendRepository.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Dependencies
import Foundation
import XCTestDynamicOverlay

public struct ZennTrendRepository: TrendRepository {
    public var fetchTrend: () async throws -> [Article]

    public init(fetchTrend: @escaping () async throws -> [Article]) {
        self.fetchTrend = fetchTrend
    }
}

extension ZennTrendRepository: TestDependencyKey {
    public static var testValue: ZennTrendRepository = .init(fetchTrend: unimplemented("QiitaTrendRepository.fetchTrend"))
}

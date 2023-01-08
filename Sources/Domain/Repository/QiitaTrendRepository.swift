//
//  QiitaTrendRepository.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Dependencies
import Foundation
import XCTestDynamicOverlay

public struct QiitaTrendRepository: TrendRepository {
    public var fetchTrend: () async throws -> RSSResponse

    public init(fetchTrend: @escaping () async throws -> RSSResponse) {
        self.fetchTrend = fetchTrend
    }
}

extension QiitaTrendRepository: TestDependencyKey {
    public static var testValue: QiitaTrendRepository = .init(fetchTrend: unimplemented("QiitaTrendRepository.fetchTrend"))
}

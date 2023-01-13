// 
//  HomeUseCase.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import Foundation
import Dependencies
import XCTestDynamicOverlay

public struct HomeUseCase {
    public var fetchSections: () async throws -> [HomeSection]
    public init(fetchSections: @escaping () async throws -> [HomeSection]) {
        self.fetchSections = fetchSections
    }
}

extension HomeUseCase: TestDependencyKey {
    static public var testValue: HomeUseCase = .init(fetchSections: unimplemented("HomeUseCase.fetchSections"))
}

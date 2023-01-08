//
//  RSSReader.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import ComposableArchitecture
import Foundation
import XCTestDynamicOverlay

public struct RSSReader {
    public var readRss: (_ url: String) async throws -> RSSResponse

    public init(readRss: @escaping (_: String) async throws -> RSSResponse) {
        self.readRss = readRss
    }
}

extension RSSReader: TestDependencyKey {
    public static let testValue = Self(
        readRss: unimplemented("RSSReader.readRss")
    )
}

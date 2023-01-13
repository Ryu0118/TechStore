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
    public var readFeed: (_ url: String) async throws -> [Article]

    public init(readRss: @escaping (_: String) async throws -> [Article]) {
        self.readFeed = readRss
    }
}

extension RSSReader: TestDependencyKey {
    public static let testValue = Self(
        readRss: unimplemented("RSSReader.readFeed")
    )
}

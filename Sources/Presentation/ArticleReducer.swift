//
//  ArticleReducer.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import Foundation
import ComposableArchitecture
import Domain

public struct ArticleReducer: ReducerProtocol {
    // MARK: - State
    public struct State: Equatable, Identifiable {
        public let id: UUID
        let article: Article
    }

    // MARK: - Action
    public enum Action: Equatable {
    }

    // MARK: - Dependencies

    public init() {}

    // MARK: - Reducer
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        
    }
}

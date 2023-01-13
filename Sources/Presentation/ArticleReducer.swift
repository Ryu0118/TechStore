//
//  ArticleReducer.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import ComposableArchitecture
import Domain

struct ArticleReducer: ReducerProtocol {
    // MARK: - State
    struct State: Equatable {
        let article: Article
    }

    // MARK: - Action
    enum Action: Equatable {
    }

    // MARK: - Dependencies

    init() {}

    // MARK: - Reducer
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        
    }
}

//
//  PagingReducer.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import ComposableArchitecture

public struct PagingReducer: ReducerProtocol {
    // MARK: - State
    public struct State: Equatable {
        var home: HomeReducer.State = .init()
    }

    // MARK: - Action
    public enum Action: Equatable {
        case home(HomeReducer.Action)
    }

    // MARK: - Dependencies

    init() {}

    // MARK: - Reducer
    public var body: some ReducerProtocolOf<Self> {
        Scope(state: \.home, action: /Action.home) {
            HomeReducer()
        }
    }
}

//
//  RootReducer.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/06.
//

import ComposableArchitecture
import Domain
import Foundation

public struct RootReducer: ReducerProtocol {
    // MARK: - State
    public struct State: Equatable {
        @BindableState var text: String = ""
        var home: HomeReducer.State = .init()
        public init() {}
    }
    
    // MARK: - Action
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case home(HomeReducer.Action)
        case onAppear
    }
    
    public init() {}
    
    // MARK: - Reducer
    public var body: some ReducerProtocolOf<Self> {
        BindingReducer()
        
        Scope(state: \.home, action: /Action.home) {
            HomeReducer()
        }
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .onAppear:
                return .none
                
            case .home:
                return .none
            }
        }

    }
}

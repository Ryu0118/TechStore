//
//  RootReducer.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/06.
//

import ComposableArchitecture
import Foundation

public struct RootReducer: ReducerProtocol {
    @Dependency(\.rssReader.readRss) var readRss

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()

        Reduce { _, action in
            switch action {
            case .binding:
                return .none
            case .onAppear:
                Task {
                    do {
                        let rss = try await readRss("https://zenn.dev/topics/swiftconcurrency/feed")
                        print(rss)
                    } catch {
                        print(error)
                    }
                }
                return .none
            }
        }
    }

    public init() {}
}

public extension RootReducer {
    struct State: Equatable {
        @BindableState var text: String
        public init(text: String = "") {
            self.text = text
        }
    }

    enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case onAppear
    }
}

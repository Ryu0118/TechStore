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
    @Dependency(\.qiitaTrendRepository.fetchTrend) var fetchQiitaTrend
    @Dependency(\.zennTrendRepository.fetchTrend) var fetchZennTrend
    @Dependency(\.articleRepository.searchArticle) var searchArticle

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()

        Reduce { _, action in
            switch action {
            case .binding:
                return .none
            case .onAppear:
                Task {
                    do {
//                        async let qiita = fetchQiitaTrend()
//                        async let zenn = fetchZennTrend()
//
//                        let (qiitaTrend, zennTrend) = try await (qiita, zenn)
//
//                        print(qiitaTrend)
//                        print(zennTrend)
                        let article = try await searchArticle(.init(query: "Swift", page: 1, perPage: 10))
                        print(article)
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

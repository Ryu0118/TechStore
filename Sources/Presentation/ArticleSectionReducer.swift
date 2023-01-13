//
//  ArticleSectionReducer.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//


import ComposableArchitecture
import Domain
import Foundation

struct ArticleSectionReducer: ReducerProtocol {
    // MARK: - State
    struct State: Equatable, Identifiable {
        let id: UUID
        let sectionTitle: String
        var articles: IdentifiedArrayOf<ArticleReducer.State>
    }

    // MARK: - Action
    enum Action: Equatable {
        case article(id: ArticleReducer.State.ID, action: ArticleReducer.Action)
    }

    // MARK: - Dependencies

    init() {}

    // MARK: - Reducer
    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .article:
                return .none
            }
        }
        .forEach(\.articles, action: /Action.article(id:action:)) {
            ArticleReducer()
        }
    }
}

//
//  ArticleView.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import ComposableArchitecture
import Domain

public struct HomeReducer: ReducerProtocol {
    // MARK: - State
    public struct State: Equatable {
        var sections: IdentifiedArrayOf<ArticleSectionReducer.State> = []
        var isLoading = false
        var isRefreshing = false
    }

    // MARK: - Action
    public enum Action: Equatable {
        case sectionResponse(TaskResult<[HomeSection]>)
        case section(id: ArticleSectionReducer.State.ID, action: ArticleSectionReducer.Action)
        case refresh
        case onAppear
    }

    // MARK: - Dependencies
    @Dependency(\.homeUseCase.fetchSections) var fetchSections
    @Dependency(\.uuid) var uuid
    
    public init() {}

    // MARK: - Reducer
    public var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.isLoading = true
                return .task {
                    await .sectionResponse(
                        TaskResult { try await fetchSections() }
                    )
                }
            case .refresh:
                state.isRefreshing = true
                return .task {
                    await .sectionResponse(
                        TaskResult { try await fetchSections() }
                    )
                }
                
            case .sectionResponse(.success(let sections)):
                state.isLoading = false
                state.isRefreshing = false
                state.sections = IdentifiedArrayOf(
                    uniqueElements: sections.map { section in
                        ArticleSectionReducer.State(
                            id: uuid(),
                            sectionTitle: section.sectionTitle,
                            articles: IdentifiedArray(
                                uniqueElements: section.articles.map { ArticleReducer.State(id: uuid(), article: $0) }
                            )
                        )
                    }
                )

                return .none
                
            case .sectionResponse:
                state.isLoading = false
                state.isRefreshing = false
                return .none
                
            case .section:
                return .none
            }
        }
        .forEach(\.sections, action: /Action.section(id:action:)) {
            ArticleSectionReducer()
        }
    }
}

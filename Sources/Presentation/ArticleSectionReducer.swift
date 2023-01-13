import ComposableArchitecture
import Domain

struct ArticleSectionReducer: ReducerProtocol {
    // MARK: - State
    struct State: Equatable {
        let section: ArticleSection
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

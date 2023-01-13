//
//  PagingView.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import SwiftUI
import ComposableArchitecture

struct PagingView: View {
    let store: StoreOf<PagingReducer>
    
    init(store: StoreOf<PagingReducer>) {
        self.store = store
    }

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            HomeView(
                store: store.scope(state: \.home, action: PagingReducer.Action.home)
            )
        }
    }
}

#if DEBUG
struct PagingView_Previews: PreviewProvider {
    static func store() -> StoreOf<PagingReducer> {
        .init(
            initialState: .init(),
            reducer: PagingReducer()
        )
    }

    static var previews: some View {
        Group {
            PagingView(store: store())
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif

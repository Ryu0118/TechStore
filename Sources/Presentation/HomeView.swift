//
//  ArticleView.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    let store: StoreOf<HomeReducer>
    
    @Environment(\.isSearching) private var isSearching

    init(store: StoreOf<HomeReducer>) {
        self.store = store
    }

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Group {
                if !viewStore.isLoading {  // ロード中ではない時
                    ScrollView {
                        LazyVStack(spacing: 5) {
                            ForEachStore(
                                store.scope(state: \.sections, action: HomeReducer.Action.section(id:action:)
                                )
                            ) { sectionStore in
                                ArticleSectionView(store: sectionStore)
                            }
                            .padding(.leading, 8)
                        }
                    }
                }
                else { // ロード中
                    ProgressView()
                        .scaleEffect(1.5)
                }
            }
            .onChange(of: isSearching) { newValue in
                print(newValue)
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .refreshable {
                await viewStore.send(.refresh, while: \.isRefreshing)
            }
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static func store() -> StoreOf<HomeReducer> {
        .init(
            initialState: .init(),
            reducer: HomeReducer()
        )
    }

    static var previews: some View {
        Group {
            HomeView(store: store())
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif

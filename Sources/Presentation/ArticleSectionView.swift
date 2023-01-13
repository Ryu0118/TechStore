// 
//  ArticleSectionView.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import Foundation
import SwiftUI
import Domain
import ComposableArchitecture

struct ArticleSectionView: View {
    let store: StoreOf<ArticleSectionReducer>
    
    var body: some View {
        WithViewStore(store, observe: { $0.sectionTitle }) { viewStore in
            VStack(spacing: 8) {
                Text(viewStore.state)
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEachStore(
                            store.scope(state: \.articles, action: ArticleSectionReducer.Action.article(id:action:))
                        ) { articleStore in
                            ArticleView(store: articleStore)
                                .frame(width: 180)
                        }
                    }
                }
            }
        }
    }
}
#if DEBUG
struct ArticleSectionView_Preview: PreviewProvider {
    static var previews: some View {
        ArticleSectionView(
            store: .init(
                initialState: .init(
                    id: UUID(),
                    sectionTitle: "Swift",
                    articles: IdentifiedArray(
                        uniqueElements: (0...10).map { _ in
                            ArticleReducer.State(id: UUID(), article: .mock())
                        }
                    )
                ),
                reducer: ArticleSectionReducer()
            )
        )
    }
}
#endif


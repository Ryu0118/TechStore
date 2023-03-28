// 
//  ArticleView.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import SwiftUI
import Domain
import Shared
import ComposableArchitecture

struct ArticleView: View {
    let store: StoreOf<ArticleReducer>
    
    var body: some View {
        WithViewStore(store, observe: { $0.article }) { viewStore in
            GeometryReader { proxy in
                VStack {
                    TSImage(url: viewStore.thumbnailUrl)
                        .frame(width: proxy.size.width, height: proxy.size.width / 1.618)
                    
                    VStack() {
                        titleLabel(viewStore)
                        bottomBar(viewStore)
                    }
                }
            }
        }
    }
}

private extension ArticleView {
    func titleLabel(
        _ viewStore: ViewStore<Article, ArticleReducer.Action>
    ) -> some View {
        Text(viewStore.title)
            .font(.headline)
            .multilineTextAlignment(.center)
            .lineLimit(3)
    }
    
    func bottomBar(
        _ viewStore: ViewStore<Article, ArticleReducer.Action>
    ) -> some View {
        HStack {
            HStack {
                Image(systemName: "clock")
                    .padding(.trailing, -3)
                Text(viewStore.updatedAt.string)
            }
            
            Spacer()
            
            Text(viewStore.linkUrl.host() ?? "")
                .foregroundColor(.secondary)
        }
        .font(.caption2)
        .padding(.top, 2)
    }
}

#if DEBUG
struct ArticleView_Preview: PreviewProvider {
    static var previews: some View {
        ArticleView(store: .init(
            initialState: .init(
                id: UUID(),
                article:
                    Article(
                        title: "SwiftUIでSwiftUIを作る画期的方法",
                        description: "",
                        updatedAt: Date(),
                        linkUrl: URL(string: "https://github.com")!,
                        thumbnailUrl: URL(string: "https://github.com/Ryu0118.png")
                    )
            ),
            reducer: ArticleReducer())
        )
    }
}
#endif

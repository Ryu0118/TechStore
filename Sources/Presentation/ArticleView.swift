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
                    
                    VStack(spacing: 8) {
                        titleLabel(viewStore)
                        bottomBar(viewStore)
                    }
                }
                .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
            }
        }
    }
}

private extension ArticleView {
    func titleLabel(
        _ viewStore: ViewStore<Article, ArticleReducer.Action>
    ) -> some View {
        Text(viewStore.title)
            .font(.title3)
            .multilineTextAlignment(.center)
            .lineLimit(3)
    }
    
    func bottomBar(
        _ viewStore: ViewStore<Article, ArticleReducer.Action>
    ) -> some View {
        HStack {
            HStack {
                Image(systemName: "clock")
                Text(viewStore.updatedAt.string)
            }
            
            Spacer()
            
            Text(viewStore.linkUrl.host() ?? "")
                .foregroundColor(.secondary)
        }
        .font(.caption)
        .padding([.leading, .trailing], 8)
    }
}

#if DEBUG
struct ArticleView_Preview: PreviewProvider {
    static var previews: some View {
        ArticleView(store: .init(
            initialState: .init(
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

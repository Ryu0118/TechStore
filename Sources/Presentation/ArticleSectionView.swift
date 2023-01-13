// 
//  ArticleSection.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import Foundation
import SwiftUI
import Domain
import ComposableArchitecture

struct ArticleSection: View {
    let store: StoreOf<ArticleSectionReducer>
    
    var body: some View {
        VStack {
            Text("Section Title")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
        }
    }
}

#if DEBUG
struct ArticleSection_Preview: PreviewProvider {
    static var previews: some View {
        ArticleSection(
            store: .init(
                initialState: .init(),
                reducer: ArticleSectionReducer()
            )
        )
    }
}
#endif

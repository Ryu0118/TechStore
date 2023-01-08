//
//  RootView.swift
//  TechStore
//
//  Created by Ryu on 2023/01/05.
//

import ComposableArchitecture
import Domain
import NukeUI
import SwiftUI

public struct RootView: View {
    public let store: StoreOf<RootReducer>

    public init(store: StoreOf<RootReducer>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationStack {
                ScrollView {
                    Section {
                        Text("Test")
                    } header: {
                        Text("Test")
                    }
                }
                .navigationTitle("TechStore")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    toolBarContent
                }
            }
            .searchable(
                text: viewStore.binding(\.$text),
                prompt: "検索したいワードを入力"
            )
            .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification)) { _ in
                print("test")
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }

    @ToolbarContentBuilder
    var toolBarContent: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {} label: {
                Image(systemName: "chart.xyaxis.line")
                    .foregroundColor(.black)
            }
        }
        ToolbarItem {
            Button(action: {}, label: {
                Image(systemName: "arrow.up.arrow.down")
                    .foregroundColor(.black)
            })
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {}, label: {
                Image(systemName: "gear")
                    .foregroundColor(.black)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(
            store: .init(
                initialState: .init(),
                reducer: RootReducer()
            )
        )
    }
}

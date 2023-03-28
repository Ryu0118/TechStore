//
//  TechStoreApp.swift
//  TechStore
//
//  Created by Ryu on 2023/01/05.
//

import ComposableArchitecture
import Presentation
import SwiftUI

@main
struct TechStoreApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(
                store: .init(
                    initialState: .init(),
                    reducer: RootReducer()
                )
            )
        }
    }
}

//
//  TSImage.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import SwiftUI
import NukeUI

struct TSImage<Placeholder: View>: View {
    let url: URL?
    let placeholder: () -> Placeholder
    
    init(
        url: URL?,
        @ViewBuilder placeholder: @escaping () -> Placeholder = { Color.gray }
    ) {
        self.url = url
        self.placeholder = placeholder
    }
    
    var body: some View {
        if let url {
            LazyImage(url: url) { state in
                if let image = state.image {
                    image
                }
                else{
                    placeholder()
                }
            }
            
        }
        else {
            // placeholder
            placeholder()
        }
    }
}

struct TSImage_Preview: PreviewProvider {
    static var previews: some View {
        TSImage(
            url: URL(string: "https://github.com/Ryu0118.png")!
        )
    }
}

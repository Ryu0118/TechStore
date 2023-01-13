//
//  TSImage.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import SwiftUI
import NukeUI

struct TSImage: View {
    let url: URL
    
    var body: some View {
        LazyImage(url: url) { state in
            if let image = state.image {
                image
            }
            else{
                Color.gray
            }
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

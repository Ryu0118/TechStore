// 
//  Dependencies.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation
import Dependencies

public extension DependencyValues {
    var rssReader: RSSReader {
        get { self[RSSReader.self] }
        set { self[RSSReader.self] = newValue }
    }
}

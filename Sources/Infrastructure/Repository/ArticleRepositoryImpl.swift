// 
//  ArticleRepositoryImpl.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/09.
//

import Foundation
import Domain
import Dependencies

extension ArticleRepository: DependencyKey {
    static public var liveValue: ArticleRepository = .init { query in
        let
    }
}

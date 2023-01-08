//
//  ArticleRepositoryImpl.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/09.
//

import Dependencies
import Domain
import Foundation

extension ArticleRepository: DependencyKey {
    public static var liveValue: ArticleRepository = .init { _ in
        let
    }
}

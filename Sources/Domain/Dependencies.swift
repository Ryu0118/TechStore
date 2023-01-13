//
//  Dependencies.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Dependencies
import Foundation

public extension DependencyValues {
    var rssReader: RSSReader {
        get { self[RSSReader.self] }
        set { self[RSSReader.self] = newValue }
    }

    var qiitaTrendRepository: QiitaTrendRepository {
        get { self[QiitaTrendRepository.self] }
        set { self[QiitaTrendRepository.self] = newValue }
    }

    var zennTrendRepository: ZennTrendRepository {
        get { self[ZennTrendRepository.self] }
        set { self[ZennTrendRepository.self] = newValue }
    }

    var articleRepository: ArticleRepository {
        get { self[ArticleRepository.self] }
        set { self[ArticleRepository.self] = newValue }
    }
    
    var homeUseCase: HomeUseCase {
        get { self[HomeUseCase.self] }
        set { self[HomeUseCase.self] = newValue }
    }
}

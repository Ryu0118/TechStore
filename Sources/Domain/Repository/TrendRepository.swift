// 
//  TrendRepository.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation

public protocol TrendRepository {
    var fetchTrend: () async throws -> RSSResponse { get set }
}

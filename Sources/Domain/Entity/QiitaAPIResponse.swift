//
//  QiitaAPIResponse.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/09.
//

import Foundation

public struct QiitaAPIResponse: Decodable {
    public let title: String
    public let url: String
    public let created_at: Date
    public let updated_at: Date
}

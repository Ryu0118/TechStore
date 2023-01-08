//
//  RssToJsonRequest.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation

struct OGPData {
    private(set) var imageURL: URL?
    private(set) var title: String?
    private(set) var description: String?
    private(set) var width: CGFloat?
    private(set) var height: CGFloat?

    var isAllEmpty: Bool {
        imageURL == nil && title == nil && description == nil
    }

    mutating func insert(_ type: OGPType, content: String) {
        switch type {
        case .image:
            imageURL = URL(string: content)
        case .title:
            title = content
        case .description:
            description = content
        case .width:
            width = CGFloat(content)
        case .height:
            height = CGFloat(content)
        }
    }
}

private extension CGFloat {
    init?(_ string: String) {
        if let double = Double(string) {
            self = CGFloat(double)
        }
        else {
            return nil
        }
    }
}

//
//  RssToJsonRequest.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation
import SwiftSoup

struct OGPTranslator {
    /// - Parameters
    ///   - from: HTML String
    ///
    /// - Returns: OGPData structure
    func getOGPData(from html: String) throws -> OGPData {
        let doc = try SwiftSoup.parse(html)
        let metaTags = try doc.select("meta")

        var ogpData = OGPData()

        for metaTag in metaTags {
            let property = try metaTag.attr("property")
            let content = try metaTag.attr("content")

            if let ogpType = OGPType(rawValue: property) {
                ogpData.insert(ogpType, content: content)
            }
        }

        return ogpData
    }
}

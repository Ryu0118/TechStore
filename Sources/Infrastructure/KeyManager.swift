//
//  KeyManager.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation

struct KeyManager {
    private let keyFilePath = Bundle.module.path(forResource: "apiKey", ofType: "plist")

    func getKeys() -> [String: String]? {
        guard let keyFilePath else { return nil }
        let url = URL(filePath: keyFilePath)

        if let data = try? Data(contentsOf: url) {
            return try? PropertyListDecoder().decode([String: String].self, from: data)
        }

        return nil
    }

    func getValue(key: String) -> String? {
        guard let keys = getKeys() else {
            return nil
        }

        return keys[key]
    }
}

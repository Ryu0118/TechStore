//
//  KeyManager.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Foundation

final class KeyManager {
    static let shared = KeyManager()
    private init() {}

    private let keyFilePath = Bundle.module.path(forResource: "apiKey", ofType: "plist")

    func getKeys() -> [String: String]? {
        guard let keyFilePath else { return nil }
        let url = URL(filePath: keyFilePath)

        if let data = try? Data(contentsOf: url) {
            return try? PropertyListDecoder().decode([String: String].self, from: data)
        }

        return nil
    }

    func getValue(key: Keys) -> String {
        guard let keys = getKeys(),
              let value = keys[key.rawValue]
        else {
            fatalError("Sources/Infrastructure/Resources/apiKey.plist not found.")
        }

        return value
    }
}

extension KeyManager {
    enum Keys: String {
        case qiitaToken
    }
}

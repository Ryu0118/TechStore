// 
//  Storage.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import Foundation

@propertyWrapper
struct Storage<T: Codable> {
    private var saved: T
    private let forKey: String
    private let userDefaults = UserDefaults.standard
    
    init(_ forKey: String, register: T) {
        self.forKey = forKey
        self.saved = register
    }
    var wrappedValue: T {
        get {
            readUserDefaultsData()
        }
        set {
            setUserDefaultsData(newValue: newValue)
        }
    }

    private func readUserDefaultsData() -> T {
        if let data = userDefaults.data(forKey: forKey) {
            do {
                return try JSONDecoder().decode(T.self, from: data)
            }catch{
                return saved
            }
        }else{
            return userDefaults.object(forKey: forKey) as? T ?? saved
        }
    }

    private func setUserDefaultsData(newValue: T) {
        do {
            let value = try JSONEncoder().encode(newValue)
            userDefaults.setValue(value, forKey: forKey)
        } catch {
            userDefaults.setValue(newValue, forKey: forKey)
        }
    }
}

// 
//  Date+.swift
//  
//
//  Created by ryunosuke.shibuya on 2023/01/13.
//

import Foundation

public extension Date {
    public var string: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}

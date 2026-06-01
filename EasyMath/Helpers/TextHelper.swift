//
//  TextHelper.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-27.
//

import Foundation

struct TextHelper {
    
    // Limit text length
    static func limitChars(input: String, limit: Int) -> String {
        
        if input.count > limit {
            return String(input.prefix(limit))
        } else {
            return input
        }
    }
    
}

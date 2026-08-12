//
//  itemsOnAvatar.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-08-12.
//

import Foundation
import SwiftData

@Model
class ItemsOnAvatar {
    
    var id = UUID()
    var nameAvatar = ""
    var items = [String]()
    
    init() {
        
    }
}

//
//  OwnedItem.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-08-10.
//

import Foundation
import SwiftData

@Model
class OwnedItem {
    
    var id = UUID()
    var soldItem: String
    
    init(soldItem: String) {
        self.soldItem = soldItem
    }
}

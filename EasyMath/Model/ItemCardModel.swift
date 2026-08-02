//
//  ItemCardModel.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-08-01.
//

import Foundation
import SwiftUI

// Data model for reward item cards
struct ItemCardModel: Identifiable {
    
    let id = UUID()
    
    var image: String
    var widthImage: CGFloat
    var colorItemBg: Color
    var price: String
    
}

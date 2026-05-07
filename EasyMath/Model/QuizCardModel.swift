//
//  QuizCardModel.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-04-23.
//

import Foundation
import SwiftUI

// Data model for quiz card UI
struct QuizCardModel: Identifiable {
    
    let id = UUID()
    
    var bg: Color
    var shadowBg: Color
    var footer: Color
    var text: String
    var number1: String
    var number2: String
    var circleColor: Color
    var image: String
    var imagePlace: String
    var padding: CGFloat
    var shadowButton: Color
    var scaleAnimal: CGFloat
    var scalePlace: CGFloat
    
    var signs: Signs
    
    enum Signs {
        case divide, subtrack, add, multiply
    }
    
}

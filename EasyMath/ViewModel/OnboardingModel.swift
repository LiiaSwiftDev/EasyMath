//
//  OnboardingModel.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-05.
//

import Foundation
import SwiftUI

@Observable
class OnboardingModel {
    
    // Avatar images
    var images = ["girl1", "girl4", "boy4", "girl3", "boy2", "boy3", "boy1", "girl2"]
    
    // Background colors for avatars
    var colors = [
        Color(red: 201/255, green: 217/255, blue: 255/255),
        Color(red: 255/255, green: 203/255, blue: 151/255),
        Color(red: 201/255, green: 220/255, blue: 162/255),
        Color(red: 201/255, green: 217/255, blue: 255/255),
        Color(red: 181/255, green: 213/255, blue: 158/255),
        Color(red: 255/255, green: 195/255, blue: 176/255),
        Color(red: 255/255, green: 202/255, blue: 195/255),
        Color(red: 249/255, green: 237/255, blue: 175/255),
    ]
    
    // Current onboarding page
    var selectedIndex = 0
    
    // User input text
    var name = ""
    
    // Controls blinking cursor visibility
    var showCursor = true
    
    // Task used for cursor blinking animation
    var animationTask: Task<Void, Never>?
    
    // Indicates whether cursor is at the end of text
    var isCursorAtEnd = false
    
    var outsideTap = false
    
    init() {
        
    }
    
    func avatarHeight(index: Int) -> CGFloat {
        
        if index == 1 {
            return 88
        } else {
            return 95
        }
        
    }
    
    // Navigate to next onboarding screen
    func goNext() {
        withAnimation {
            selectedIndex += 1
        }
    }
    
    // Updates whether cursor is at the end of the text
    func updateIsCursorAtEnd() {
        
        if name.count > 5 {
            isCursorAtEnd = true
        }
        else {
            isCursorAtEnd = false
        }
    }
    
    // Cursor blinking animation
    func animatoinСursor() {
        
        animationTask?.cancel()
        
        animationTask = Task {
            
            while !Task.isCancelled {
                
                try? await Task.sleep(nanoseconds: 500_000_000)
                
                await MainActor.run {
                    
                    showCursor.toggle()
                    
                }
                
            }
        }
        
    }
    
    // Returns letter at given index (or empty string)
    func character(at index: Int) -> String {
        
        guard index < name.count else { return "" }
        
        let array = Array(name)
        
        return String(array[index])
    }
    
    // Limits input length
    func limitChar(input: String, limit: Int) -> String {
        
        if input.count > limit {
            
            return String(input.prefix(limit))
            
        } else {
            
            return input
            
        }
        
    }
    
}

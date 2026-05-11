//
//  FeedbackBanner.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-10.
//

import SwiftUI

struct FeedbackBanner: View {
    
    var correct: Bool
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .frame(height: 48)
                .foregroundStyle(correct ? Color(red: 217/255, green: 226/255, blue: 195/255) : Color(red: 255/255, green: 215/255, blue: 215/255))
                .padding(.vertical, 13)
            
            HStack {
                // Status icon
                Image(systemName: correct ? "checkmark" : "xmark")
                    .font(.system(.title, design: .rounded, weight: .heavy))
                    .foregroundStyle(correct ? Color(red: 11/255, green: 105/255, blue: 0/255) : Color(red: 174/255, green: 0/255, blue: 0/255))
                
                // Status text
                Text(correct ? "Correct" : "Incorrect")
                    .foregroundStyle(correct ? Color(red: 11/255, green: 105/255, blue: 0/255) : Color(red: 174/255, green: 0/255, blue: 0/255))
                    .font(Font.system(.title2, design: .rounded, weight: .bold))
            }
        }
    }
}

#Preview {
    FeedbackBanner(correct: true)
}

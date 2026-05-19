//
//  StartOverButton.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-19.
//

import SwiftUI

struct StartOverButton: View {
    
    @Environment(MainViewModel.self) private var model
    @Environment(QuizViewModel.self) private var quizModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button {
            
            // Closes the current screen and restarts the quiz with a new question.
            dismiss()
            quizModel.quizExample(sign: quizModel.currentSign)
            
        } label: {
            ZStack {
                // Background
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 50)
                    .foregroundStyle(RadialGradient(
                        colors: [
                            Color(red: 255/255, green: 172/255, blue: 31/255),
                            Color(red: 255/255, green: 163/255, blue: 6/255)
                        ],
                        center: .center,
                        startRadius: 30,
                        endRadius: 70
                    ))
                    .overlay(content: {
                        // Border
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 0.5)
                            .foregroundStyle(Color(red: 234/255, green: 127/255, blue: 0/255))
                            .frame(height: 51)
                    })
                    .shadow(color: Color(red: 238/255, green: 119/255, blue: 4/255), radius: 2, y: 6)
                
                HStack {
                    Image(systemName: "arrow.clockwise")
                        .foregroundStyle(Color.white)
                        .font(.system(.title2, design: .rounded, weight: .bold))
                        .padding(.trailing, 2)
                    
                    // Label
                    Text("Start Over")
                        .foregroundStyle(Color.white)
                        .font(.system(.title2, design: .rounded, weight: .bold))
                }
            }
        }
    }
}

#Preview {
    StartOverButton()
}

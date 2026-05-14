//
//  NextButton.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-07.
//

import SwiftUI

struct NextButton: View {
    
    @Environment(QuizViewModel.self) private var quizModel
    
    var text: String
    // Show SF symbol
    var showImage: Bool
    
    var body: some View {
        
        // Next/Done button
        Button {
            
            // check if answer is correct and give feedback
            quizModel.checkAnswer()
            
        } label: {
            ZStack {
                if quizModel.selectedAnswer == nil {
                    // Background
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundStyle(Color(red: 223/255, green: 223/255, blue: 223/255))
                        .shadow(color: Color(red: 136/255, green: 136/255, blue: 136/255), radius: 2, y: 6)
                }
                else {
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
                }
                
                HStack {
                    if showImage {
                        Image(systemName: "arrow.clockwise")
                            .foregroundStyle(Color.white)
                            .font(.system(.title2, design: .rounded, weight: .bold))
                            .padding(.trailing, 2)
                    }
                    
                    // Label
                    Text(quizModel.showBanner ? "Next" : text)
                        .foregroundStyle(quizModel.selectedAnswer != nil ? Color.white : Color(red: 177/255, green: 177/255, blue: 177/255))
                        .font(.system(.title2, design: .rounded, weight: .bold))
                }
            }
        }
        // Disable done button
        .disabled(quizModel.selectedAnswer == nil)
    }
}

#Preview {
    NextButton(text: "Done", showImage: true)
}

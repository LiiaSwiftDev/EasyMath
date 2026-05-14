//
//  AnswerButton.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-07.
//

import SwiftUI

struct AnswerButton: View {
    
    @Environment(QuizViewModel.self) private var quizModel
    
    // Action when user taps answer
    let onTab: () -> Void
    
    var answer: String
    
    // Is this answer selected
    var selected: Bool
    
    var body: some View {
        // Answer option button
        Button {
            onTab()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(selected ? Color(red: 255/255, green: 239/255, blue: 218/255) : .white)
                    .frame(width: 95, height: 95)
                    .shadow(radius: 4, y: 4)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: selected ? 3 : 0.3)
                            .foregroundStyle(selected ? Color(red: 255/255, green: 163/255, blue: 6/255) : .gray)
                            .frame(width: 96, height: 96)
                    }
                
                
                // Answer option
                Text(answer)
                    .font(.system(.title, design: .rounded, weight: .semibold))
                    .foregroundStyle(selected ? Color(red: 255/255, green: 163/255, blue: 6/255) : Color.black)
            }
        }
        .disabled(quizModel.showBanner == true)
    }
}

#Preview {
    AnswerButton(onTab: {
        // nothing
    }, answer: "15", selected: true)
}

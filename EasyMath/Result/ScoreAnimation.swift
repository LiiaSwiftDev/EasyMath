//
//  ScoreAnimation.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-18.
//

import SwiftUI

struct ScoreAnimation: View {
    
    @Environment(QuizViewModel.self) private var quizModel
    @Environment(ResultViewModel.self) private var resultModel
    
    var body: some View {
        
        // Show earned points animation
        ZStack {
            Text("+\(quizModel.correctAnswerCount)")
                .font(.system(size: 40, weight: .medium, design: .rounded))
                .foregroundStyle(Color(red: 151/255, green: 6/255, blue: 0/255))
                .offset(x: resultModel.scoreAnimation ? 150 : 110, y: resultModel.scoreAnimation ? -170 : -120)
                .opacity(resultModel.scoreAnimation ? 1 : 0)
                .animation(.easeOut(duration: 1.5),
                           value: resultModel.scoreAnimation)
        }
        .onAppear {
            resultModel.scoreAnimation = true
        }
        .onDisappear {
            resultModel.scoreAnimation = false
        }
    }
}

#Preview {
    ScoreAnimation()
}

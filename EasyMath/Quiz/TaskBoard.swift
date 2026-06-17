//
//  TaskBoard.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-07.
//

import SwiftUI

struct TaskBoard: View {
    
    @Environment(QuizViewModel.self) private var quizModel
    
    var body: some View {
        ZStack {
            // Board background
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 270)
                .foregroundStyle(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 0)
            
            // Vertical lines
            HStack {
                Rectangle()
                    .foregroundStyle(Color.black)
                    .frame(width: 1)
                
                Spacer()
                
                Rectangle()
                    .foregroundStyle(Color.black)
                    .frame(width: 1)
                
            }.padding(.horizontal, 26)
            
            // Horizontal lines
            VStack {
                Rectangle()
                    .foregroundStyle(Color.black)
                    .frame(height: 1)
                
                Spacer()
                
                Rectangle()
                    .foregroundStyle(Color.black)
                    .frame(height: 1)
            }.padding(.vertical, 52)
            
            // If user choose wrong answer
            if quizModel.answerIsCorrect == false {
                // Feedback banner
                AnswerBanner()
            }
            
            ZStack {
                // Math problem
                Text(quizModel.example)
                    .foregroundStyle(Color.black)
                    .font(.system(.largeTitle, design: .rounded, weight: .semibold))
                    .scaleEffect(quizModel.scaleExample)
                
                ForEach(Array(quizModel.checkmarks.enumerated()), id: \.offset) { index, mark in
                    Checkmark(checkmarkItem: mark)
                        .offset(
                            x: CGFloat(quizModel.showCheckmarks ? quizModel.position[index].x : 0),
                            y: CGFloat(quizModel.showCheckmarks ? quizModel.position[index].y : 0))
                        .scaleEffect(quizModel.scale)
                    // Applies to offset + scale animation
                        .animation(
                            .easeOut(duration: 0.3)
                            .delay(Double.random(in: 0...0.25)),
                            value: quizModel.showCheckmarks
                        )
                        .opacity(quizModel.showCheckmarks ? 1 : 0)
                    // Applies to opacity animation
                        .animation(.easeOut(duration: 0.1), value: quizModel.showCheckmarks)
                    
                }.opacity(quizModel.opacityCheckmark)
                
                // Fireworks animation
                if quizModel.trigger {
                    FireworkBurst()
                        .onAppear {
                            // Auto reset after animation
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                quizModel.trigger = false
                            }
                        }
                }
            }
            
            // Decorative lion image
            Image("lion")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 170)
                .offset(x: -70, y: -130)
                .rotationEffect(.degrees(-13))
            
        }
        .frame( height: 270)
        .padding(.horizontal, 40)
        .onChange(of: quizModel.showAnimation) { OldValue, NewValue in
            
            // Example scale pop animation
            withAnimation(.easeIn(duration: 0.2)) {
                quizModel.scaleExample = 0.7
            }
            
            withAnimation(.easeOut(duration: 0.3).delay(0.12)) {
                quizModel.scaleExample = 1.2
            }
            
            withAnimation(.easeInOut(duration: 0.35).delay(0.17)) {
                quizModel.scaleExample = 1
            }
            
            // Сheckmark animation
            quizModel.animation()
            
            // Firework animation
            quizModel.trigger = true
            
        }
    }
}

#Preview {
    TaskBoard()
}

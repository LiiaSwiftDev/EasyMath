//
//  QuizView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-07.
//

import SwiftUI

struct QuizView: View {
    
    @Environment(MainViewModel.self) private var model
    @Environment(QuizViewModel.self) private var quizModel
    
    // Connection to the navigation path from MainView.
    @Binding var path: [Int]
    
    var body: some View {
        
        @Bindable var quizModel = quizModel
        
        ZStack {
            
            // Background color
            Color(red: 255/255, green: 243/255, blue: 220/255)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                
                // Question progress
                HStack {
                    Spacer()
                    
                    Text("\(quizModel.progressIndicator)/10")
                        .foregroundStyle(Color.gray)
                        .font(.system(.largeTitle, design: .rounded, weight: .semibold))
                }
                .padding(.horizontal, 35)
                .padding(.bottom, 40)
                
                // Math task board
                TaskBoard()
                
                // Show correсt/incorrect banner
                if quizModel.showBanner == true {
                    FeedbackBanner(correct: quizModel.answerIsCorrect, banner: true)
                }
                else {
                    // Ask user to choose an answer
                    FeedbackBanner(correct: quizModel.answerIsCorrect, banner: false)
                }
                
                // Answer options
                LazyVGrid(columns:
                            [GridItem(.fixed(95), spacing: 68),
                             GridItem(.fixed(95), spacing: 68)], spacing: 28) {
                    ForEach(quizModel.quizOptions, id: \.self) { option in
                        AnswerButton(
                            onTab: {
                                quizModel.selectedAnswer = option
                            },
                            answer: option, selected: quizModel.selectedAnswer == option)
                    }
                }.padding(.bottom, 40)
                
                // Next button
                NextButton(path: $path)
                    .padding(.bottom, 70)
                    .padding(.horizontal, 40)
            }
        }
        .onAppear {
            // Generate a math example using the selected operation.
            quizModel.quizExample(sign: model.selectedCard!.signs)
            
            // Save the current math sign
            quizModel.currentSign = model.selectedCard!.signs
        }
        .onDisappear {
            quizModel.progressIndicator = 1
            quizModel.usedExamples.removeAll()
            
            // Reset score only if user exits the quiz before reaching ResultView.
            if !path.contains(2) {
                quizModel.correctAnswerCount = 0
            }
        }
    }
}


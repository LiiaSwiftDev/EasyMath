//
//  QuizView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-07.
//

import SwiftUI

struct QuizView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(MainViewModel.self) private var model
    @Environment(QuizViewModel.self) private var quizModel
    
    // Connection to the navigation path from MainView.
    @Binding var path: [Int]
    
    var body: some View {
        
        @Bindable var quizModel = quizModel
        
        ZStack(alignment: .top) {
            
            // Background
            Color(red: 255/255, green: 243/255, blue: 220/255)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Quiz progress
                HStack {
                    Button {
                        dismiss()
                        
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                    }
                    
                    Spacer()
                    
                    Text("\(quizModel.progressIndicator)/10")
                        .font(.system(.title2, design: .rounded, weight: .bold))
                }
                .foregroundStyle(Color.gray)
                .padding(.horizontal, 20)
                .padding(.bottom, 60)
                .padding(.top, 10)
                
                // Math board
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
                        
                        // Haptic feedback
                        .sensoryFeedback(.impact(weight: .light, intensity: 0.8), trigger: quizModel.selectedAnswer == option)
                    }
                }
                
                Spacer(minLength: 30)
                
                // Next button
                NextButton(path: $path)
                    .padding(.horizontal, 40)
                
                Spacer(minLength: 40)
            }
        }
        .navigationBarBackButtonHidden(true)
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
            
            quizModel.resetCheckmarkState()
        }
    }
}


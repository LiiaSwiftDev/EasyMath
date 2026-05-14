//
//  QuizView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-07.
//

import SwiftUI

struct QuizView: View {
    
    @Environment(QuizViewModel.self) private var quizModel
    
    // Quiz card selected by user
    var numberOfCard: QuizCardModel
    
    var body: some View {
        ZStack {
            
            // Background color
            Color(red: 255/255, green: 243/255, blue: 220/255)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                
                // Question progress
                HStack {
                    Spacer()
                    
                    Text("1/10")
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
                NextButton(text: "Done", showImage: false)
                    .padding(.bottom, 70)
                    .padding(.horizontal, 40)
                
            }
        }
        .onAppear {
            
            switch numberOfCard.signs {
            case .multiply:
                quizModel.multiplyExample()
            case .add:
                quizModel.additionExample()
            case .subtrack:
                quizModel.subtractExample()
            case .divide:
                quizModel.divideExample()
            }
        }
        .onDisappear {
            quizModel.reset()
        }
    }
}

#Preview {
    QuizView(numberOfCard: QuizCardModel(
        bg: Color(red: 97/255, green: 116/255, blue: 177/255),
        shadowBg: Color(red: 125/255, green: 144/255, blue: 189/255),
        footer: Color(red: 81/255, green: 98/255, blue: 155/255),
        text: "Divide",
        number1: "9",
        number2: "3",
        circleColor: Color(red: 54/255, green: 69/255, blue: 111/255),
        image: "fish",
        imagePlace: "reef",
        padding: 90,
        shadowButton: Color(red: 58/255, green: 71/255, blue: 106/255),
        scaleAnimal: 39.0,
        scalePlace: 54.0,
        signs: .divide))
}

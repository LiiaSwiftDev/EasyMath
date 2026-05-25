//
//  ResultView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-10.
//

import SwiftUI
import SwiftData

struct ResultView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(QuizViewModel.self) private var quizModel
    @Environment(ResultViewModel.self) private var resultModel
    
    @Query var scores: [Score]
    
    // Connection to the navigation path from MainView.
    @Binding var path: [Int]
    
    var body: some View {
        ZStack {
            // Background color
            LinearGradient(colors: [
                Color(red: 253/255, green: 249/255, blue: 246/255),
                Color(red: 255/255, green: 243/255, blue: 220/255)],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top bar with profile and score
                TopBar(path: $path)
                
                // Result illustration
                Image(resultModel.resultImage(score: quizModel.correctAnswerCount))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .padding(.top, 90)
                
                // Result message
                Text(resultModel.text)
                    .font(.system(.title2, design: .rounded, weight: .bold))
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 10)
                
                // Score badge
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 96, height: 42)
                        .foregroundStyle(Color(red: 252/255, green: 237/255, blue: 216/255))
                    
                    Text("\(quizModel.correctAnswerCount)/10")
                        .foregroundStyle(Color.black)
                        .font(.system(.title, design: .rounded, weight: .bold))
                        .kerning(2)
                }
                
                // Restart button
                StartOverButton()
                    .padding(.top, 82)
                    .padding(.horizontal, 20)
                
                // Home button
                HomeButton(path: $path)
                    .padding(.horizontal, 20)
                    .padding(.top, 26)
                    .padding(.bottom, 50)
                
            }
            .background {
                // Decorative bubbles
                Buble(width: 24)
                    .offset(x: 70, y: -280)
                
                Buble(width: 30)
                    .offset(x: -95, y: -260)
                
                Buble(width: 26)
                    .offset(x: 145, y: -160)
                
                Buble(width: 24)
                    .offset(x: -150, y: -90)
                
            }
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden(true)
        .onDisappear {
            quizModel.correctAnswerCount = 0
        }
        .onAppear {
            resultModel.feedbackText(correct: quizModel.correctAnswerCount)
            if path.contains(2) {
                Task {
                    // Update or create user score in SwiftData
                    await resultModel.increaseScore(scores: scores, correctAnswer: quizModel.correctAnswerCount, context: context)
                }
            }
        }
    }
}


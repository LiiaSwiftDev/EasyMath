//
//  ResultView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-10.
//

import SwiftUI
import SwiftData
import RiveRuntime

struct ResultView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(QuizViewModel.self) private var quizModel
    @Environment(ResultViewModel.self) private var resultModel
    
    @Query var scores: [Score]
    
    // Connection to the navigation path from MainView.
    @Binding var path: [Int]
    
    let rive = RiveViewModel(fileName: "12079-22976-confetti")
    
    var body: some View {
        
        GeometryReader { proxy in
            ZStack(alignment: .top) {
                
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
                    
                    ZStack {
                        // Result illustration
                        Image(resultModel.resultImage(score: quizModel.correctAnswerCount))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 300)
                            .padding(.top, proxy.size.height * 0.11)
                        
                        // Show earned points animation
                        if resultModel.triggerScore && quizModel.correctAnswerCount > 0 {
                            ScoreAnimation()
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                                        withAnimation {
                                            resultModel.triggerScore = false
                                        }
                                    }
                                }
                        }
                    }
                    
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
                    
                    Spacer(minLength: 0)
                    
                    // Restart button
                    StartOverButton()
                        .padding(.top, proxy.size.height * 0.1)
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
            .overlay(content: {
                // Confetti animation
                if resultModel.showConfetti {
                    rive.view()
                        .frame(height: 400)
                        .offset(y: -270)
                        .ignoresSafeArea()
                }
            })
            .navigationBarBackButtonHidden(true)
            .onDisappear {
                if !path.contains(3) {
                    quizModel.correctAnswerCount = 0
                    resultModel.scoreAlreadySaved = false
                }
            }
            .onAppear {
                resultModel.feedbackText(correct: quizModel.correctAnswerCount)
                
                if !resultModel.scoreAlreadySaved {
                    
                    resultModel.scoreAlreadySaved = true
                    
                    Task {
                        // Update or create user score in SwiftData
                        await resultModel.increaseScore(scores: scores, correctAnswer: quizModel.correctAnswerCount, context: context)
                    }
                    
                    confetti()
                    resultModel.triggerScore = true
                }
            }
        }
    }
    
    func confetti() {
        if quizModel.correctAnswerCount > 7  {
            
            resultModel.animationConfetti = Task {
                
                await MainActor.run {
                    resultModel.showConfetti = true
                }
                
                try? await Task.sleep(nanoseconds: 1_700_000_000)
                
                await MainActor.run {
                    resultModel.showConfetti = false
                }
                
            }
        }
    }
    
}


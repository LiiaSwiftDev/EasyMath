//
//  QuizView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-07.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        ZStack {
            
            // Background color
            Color(red: 255/255, green: 243/255, blue: 220/255)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                
                // Task number
                HStack {
                    Spacer()
                    
                    Text("1/10")
                        .foregroundStyle(Color.gray)
                        .font(.system(.largeTitle, design: .rounded, weight: .semibold))
                }
                .padding(.horizontal, 35)
                .padding(.bottom, 40)
                
                // Task board
                TaskBoard()
                    .padding(.bottom, 25)
                
                Text("Choose the correct answer")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.bottom, 20)
                
                // Four answer options
                LazyVGrid(columns:
                            [GridItem(.fixed(95), spacing: 68),
                             GridItem(.fixed(95), spacing: 68)], spacing: 28) {
                    ForEach(1...4, id: \.self) { one in
                        AnswerButton()
                    }
                }.padding(.bottom, 40)
                
                // Next button
                NextButton()
                    .padding(.bottom, 50)
                
            }
        }
    }
}

#Preview {
    QuizView()
}

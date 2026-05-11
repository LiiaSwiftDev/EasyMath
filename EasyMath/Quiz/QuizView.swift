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
                
                // Instruction text
                Text("Choose the correct answer")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.vertical, 20)
                
                // Answer options
                LazyVGrid(columns:
                            [GridItem(.fixed(95), spacing: 68),
                             GridItem(.fixed(95), spacing: 68)], spacing: 28) {
                    ForEach(1...4, id: \.self) { one in
                        AnswerButton()
                    }
                }.padding(.bottom, 40)
                
                // Next button
                NextButton(text: "Done", showImage: false)
                    .padding(.bottom, 50)
                    .padding(.horizontal, 40)
                
            }
        }
    }
}

#Preview {
    QuizView()
}

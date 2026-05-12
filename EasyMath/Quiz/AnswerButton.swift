//
//  AnswerButton.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-07.
//

import SwiftUI

struct AnswerButton: View {
    
    var answer: String
    
    var body: some View {
        // Answer option button
        Button {
            // TODO
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(Color.white)
                    .frame(width: 95, height: 95)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 0.3)
                            .foregroundStyle(Color.gray)
                            .frame(width: 96, height: 96)
                    }
                    .shadow(radius: 4, y: 4)
                
                // Answer option
                Text(answer)
                    .font(.system(.largeTitle, design: .rounded, weight: .semibold))
                    .foregroundStyle(Color.black)
            }
        }
    }
}

#Preview {
    AnswerButton(answer: "15")
}

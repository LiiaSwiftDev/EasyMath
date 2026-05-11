//
//  AnswerBanner.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-10.
//

import SwiftUI

struct AnswerBanner: View {
    var body: some View {
        // Banner with correct answer
        ZStack {
            
            //  Background
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.white)
                .frame(height: 58)
                .padding(.horizontal, 18)
                .overlay {
                    // Border
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 0.3)
                        .foregroundStyle(Color.gray)
                        .frame(height: 58)
                        .padding(.horizontal, 18)
                }
            
            HStack(spacing: 6) {
                Image("light-bulb")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36)
                
                Text("Correct Answer:")
                    .font(.system(.title3, design: .rounded))
                    .foregroundStyle(Color.black)
                    .padding(.trailing, 6)
                
                // Correct answer on math problem
                ZStack {
                    Circle()
                        .frame(width: 45)
                        .foregroundStyle(Color(red: 217/255, green: 217/255, blue: 217/255))
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 0.3)
                                .frame(width: 45)
                                .foregroundStyle(Color(red: 152/255, green: 152/255, blue: 152/255))
                        }
                    
                    Text("15")
                        .font(.system(.title2, design: .rounded, weight: .semibold))
                }
            }
        }
        .frame(maxHeight: 58)
        .padding(.top, 170)
    }
}

#Preview {
    AnswerBanner()
}

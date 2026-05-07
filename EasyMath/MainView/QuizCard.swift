//
//  CardBg.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-04-22.
//

import SwiftUI

struct QuizCard: View {
    
    // Card data model
    var card: QuizCardModel
    
    var body: some View {
        ZStack {
            
            // Card background shape
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 222)
                .foregroundColor(card.bg)
                .shadow(color: card.shadowBg, radius: 5, x: 4, y: 6)
            
            // Main math expression (e.g. 9 + 3)3
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    
                    Text(card.number1)
                        .font(Font.system(size: 60, design: .rounded))
                        .bold()
                        .foregroundStyle(Color.white)
                        .padding(.top, 90)
                    
                    Spacer()
                    
                    // Math operation sign
                    VStack(spacing: 8) {
                        
                        Spacer()
                        
                        switch card.signs {
                        case .divide:
                            MathSign(mathSign: "divide")
                            
                        case .subtrack:
                            MathSign(mathSign: "minus")
                            
                        case .add:
                            MathSign(mathSign: "plus")
                            
                        case .multiply:
                            MathSign(mathSign: "multiply")
                            
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Text(card.number2)
                        .font(Font.system(size: 60, design: .rounded))
                        .bold()
                        .foregroundStyle(Color.white)
                        .padding(.bottom, 90)
                    
                    Spacer()
                }
                
                // Bottom strip
                Rectangle()
                    .frame(height: 54)
                    .foregroundStyle(Color(red: 255/255, green: 243/255, blue: 220/255))
                    .clipShape((UnevenRoundedRectangle(bottomLeadingRadius: 15, bottomTrailingRadius: 15)))
            }
            
            VStack(spacing: 0) {
                // Animal image
                ZStack {
                    Circle()
                        .frame(height: 60)
                        .foregroundStyle(card.circleColor)
                    
                    Image(card.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: card.scaleAnimal)
                }
                .frame(height: 60)
                .padding(.trailing, 80)
                .padding(.top, 20)
                
                Spacer(minLength: 0)
                
                // Place image
                Image(card.imagePlace)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: card.scalePlace)
                    .padding(.leading, card.padding)
                
                // Bottom strip of the card
                ZStack {
                    Rectangle()
                        .frame(height: 54)
                        .foregroundStyle(card.footer)
                        .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 15, bottomTrailingRadius: 15))
                    
                    HStack {
                        Spacer(minLength: 0)
                        
                        Text(card.text)
                            .foregroundStyle(Color.white)
                            .bold()
                            .font(Font.system(.title2, design: .rounded))
                        
                        Spacer(minLength: 0)
                        
                        ButtonStart(shadow: card.shadowButton)
                        
                    }.padding(.horizontal, 10)
                }
            }
        } .frame(height: 222)
    }
}

#Preview {
    QuizCard(card: QuizCardModel(bg: Color.blue, shadowBg: Color.red, footer: Color.brown, text: "Divide", number1: "9", number2: "3", circleColor: Color.black, image: "fish", imagePlace: "reef", padding: 90, shadowButton: Color.red, scaleAnimal: 39, scalePlace: 54, signs: .divide))
}

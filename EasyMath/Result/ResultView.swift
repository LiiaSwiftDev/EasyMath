//
//  ResultView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-10.
//

import SwiftUI

struct ResultView: View {
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
                TopBar()
                
                // Result illustration
                Image("lion-smile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .padding(.top, 90)
                
                // Result message
                Text("Good job!")
                    .font(.system(.title2, design: .rounded, weight: .bold))
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 10)
                
                // Score badge
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 96, height: 42)
                        .foregroundStyle(Color(red: 252/255, green: 237/255, blue: 216/255))
                    
                    Text("9/10")
                        .foregroundStyle(Color.black)
                        .font(.system(.title, design: .rounded, weight: .bold))
                }
                
                // Restart button
                NextButton(text: "Start Over", showImage: true)
                    .padding(.top, 82)
                    .padding(.horizontal, 20)
                
                // Home button
                HomeButton()
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
    }
}

#Preview {
    ResultView()
}

//
//  Onboarding1.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-01.
//

import SwiftUI

struct Onboarding1: View {
    var body: some View {
        ZStack {
            
            // Background color
            Color(red: 251/255, green: 255/255, blue: 255/255)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                
                // Title
                Text("Welcome to\nEasy Math!")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .kerning(3)
                    .foregroundStyle(Color.black)
                    .lineSpacing(6)
                    .padding(.leading, 45)
                    .padding(.bottom, 17)
                
                // Subtitle
                Text("Let’s learn, play and\nhave fun with math!")
                    .font(.system(size: 17))
                    .kerning(1)
                    .foregroundStyle(Color.black)
                    .lineSpacing(4)
                    .padding(.leading, 45)
                    .padding(.bottom, 52)
                
                VStack(spacing: 0) {
                    
                    // Illustration image
                    Image("calculator")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 317, height: 317)
                    
                    // Start button
                    ZStack {
                        Capsule()
                            .frame(width: 200, height: 45)
                            .foregroundStyle(Color(red: 241/255, green: 1/255, blue: 111/255))
                            .overlay {
                                Capsule()
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(Color(red: 206/255, green: 43/255, blue: 105/255))
                            }
                        
                        // Button text
                        Text("Let's Go!")
                            .foregroundStyle(Color.white)
                            .font(.title3)
                        
                    }.padding(.top, 120)
                    
                }.frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    Onboarding1()
}

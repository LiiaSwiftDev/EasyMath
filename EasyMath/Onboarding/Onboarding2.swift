//
//  Onboarding2.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-01.
//

import SwiftUI

struct Onboarding2: View {
    
    @Environment(OnboardingModel.self) var onboardingModel
    
    var nextButton: () -> Void
    var skipButton: () -> Void
    
    var body: some View {
        
        @Bindable var onboardingModel = onboardingModel
        
        ZStack {
            
            // Background color
            Color(red: 251/255, green: 255/255, blue: 255/255)
            
            VStack(alignment: .leading, spacing: 0) {
                
                // Greeting text
                Text("Hello!")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 10)
                
                // Title
                Text("What’s your name?")
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .kerning(3)
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 17)
                
                // Instruction text
                Text("Enter your name to get started")
                    .font(.system(size: 15, weight: .medium))
                    .kerning(1)
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 42)
                
                VStack(spacing: 0) {
                    
                    // Illustration image
                    Image("pencil")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 248, height: 248)
                    
                    
                    TextField("name", text: $onboardingModel.name)
                        .textFieldStyle(.roundedBorder)
                        .padding(.vertical, 40)
                    
                    // Bottom navigation buttons
                    HStack(spacing: 34) {
                        
                        // Skip onboarding
                        Skip(onTap: {
                            skipButton()
                        })
                        
                        // Go to next screen
                        Next(onTap: {
                            nextButton()
                        })
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                }.frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    Onboarding2(nextButton: {
        // nothing
    }, skipButton: {
        // nothing
    })
}

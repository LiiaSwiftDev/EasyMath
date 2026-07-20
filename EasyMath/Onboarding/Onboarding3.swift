//
//  Onboarding3.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-01.
//

import SwiftUI

struct Onboarding3: View {
    
    @Environment(OnboardingViewModel.self) var onboardingModel
    @Environment(MainViewModel.self) private var model
    
    var nextButton: () -> Void
    var skipButton: () -> Void
    
    var body: some View {
        
        ZStack {
            
            // Background color
            Color(red: 251/255, green: 255/255, blue: 255/255)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                
                // Greeting text
                Text("Hi, Robert!")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 10)
                
                // Title
                Text("Choose your Avatar")
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .kerning(3)
                    .foregroundStyle(Color.black)
                
                // Avatar grid
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 32) {
                    ForEach(onboardingModel.images.indices, id: \.self) { index in
                        
                        Avatar(imageName: onboardingModel.images[index], color: onboardingModel.colors[index],
                               height: onboardingModel.avatarHeight(index: index), stroke: onboardingModel.selected == index, onTap: {
                            
                            // Select avatar
                            onboardingModel.selected = index
                        })
                    }
                }
                .padding(.vertical, 44)
                .padding(.horizontal, 20)
                
                // Bottom navigation buttons
                HStack(spacing: 34) {
                    
                    // Skip onboarding
                    Skip(onTap: {
                        skipButton()
                    })
                    
                    // Finish onboarding and open app
                    Next(onTap: {
                        nextButton()
                    })
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.horizontal, 20)
        }
        .scaleEffect(model.isIPad ? 0.8 : 1)
    }
}

#Preview {
    Onboarding3(nextButton: {
        // nothing
    }, skipButton: {
        // nothing
    })
}

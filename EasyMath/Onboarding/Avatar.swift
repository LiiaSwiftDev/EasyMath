//
//  Avatar.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-03.
//

import SwiftUI

struct Avatar: View {
    
    @Environment(OnboardingViewModel.self) var onboardingModel
    
    var imageName: String
    var color: Color
    var height: CGFloat
    var stroke: Bool
    
    // Action when avatar is tapped
    var onTap: () -> Void
    
    var body: some View {
        
        Button {
            
            // Trigger haptic feedback
            onboardingModel.tapped.toggle()
            
            // Shrink avatar
            withAnimation(.easeIn(duration: 0.2)) {
                onboardingModel.scale = 0.85
            }
            
            // Expand avatar
            withAnimation(.easeOut(duration: 0.3).delay(0.12)) {
                onboardingModel.scale = 1.1
            }
            
            // Return to normal size
            withAnimation(.easeOut(duration: 0.35).delay(0.17)) {
                onboardingModel.scale = 1.0
            }
            
            onTap()
            
        } label: {
            ZStack {
                // Avatar background
                Circle()
                    .frame(width: onboardingModel.width)
                    .foregroundStyle(color)
                
                // Image
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: height)
                    .offset(y: 10)
                
                
            }
            .frame(width: onboardingModel.width, height: onboardingModel.width)
            .clipShape(Circle())
            .overlay {
                
                // Selection border
                Circle()
                    .stroke(lineWidth: stroke ? 3 : 0)
                    .foregroundStyle(stroke ? Color(red: 241/255, green: 1/255, blue: 111/255) : .clear)
                    .frame(width: onboardingModel.width + 2)
                
            }
        }
        .buttonStyle(.plain)
        
        // Tap animation
        .scaleEffect(onboardingModel.scale)
        
        // Haptic feedback
        .sensoryFeedback(.impact(weight: .light, intensity: 0.8), trigger: onboardingModel.tapped)
    }
}

#Preview {
    Avatar(imageName: "boy1", color: Color.yellow, height: 95, stroke: true, onTap: {
        
    })
}

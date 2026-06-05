//
//  Onboarding.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-04.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(OnboardingModel.self) var onboardingModel
    
    var body: some View {
        
        @Bindable var onboardingModel = onboardingModel
        
        ZStack {
            
            TabView(selection: $onboardingModel.selectedIndex) {
                
                Onboarding1(actionButton: {
                    
                    // Navigate to the second onboarding screen
                    onboardingModel.goNext()
                    
                })
                .tag(0)
                
                Onboarding2(nextButton: {
                    
                    // Navigate to the second onboarding screen
                    onboardingModel.goNext()
                    
                }, skipButton: {
                    
                    // Skip onboarding
                    dismiss()
                    
                })
                .tag(1)
                
                Onboarding3(nextButton: {
                    
                    // Navigate to the final onboarding screen
                    dismiss()
                    
                }, skipButton: {
                    
                    // Skip onboarding
                    dismiss()
                    
                })
                .tag(2)
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            // Page indicator for first onboarding
            VStack {
                Spacer()

                HStack(spacing: 21) {
                    Circle()
                        .frame(width: 12)
                        .foregroundStyle(
                            onboardingModel.selectedIndex == 0
                            ? Color(red: 241/255, green: 1/255, blue: 111/255)
                            : .clear
                        )

                    Circle()
                        .frame(width: 12)
                        .foregroundStyle(
                            onboardingModel.selectedIndex == 0
                            ? Color(red: 249/255, green: 193/255, blue: 214/255)
                            : .clear
                        )

                    Circle()
                        .frame(width: 12)
                        .foregroundStyle(
                            onboardingModel.selectedIndex == 0
                            ? Color(red: 249/255, green: 193/255, blue: 214/255)
                            : .clear
                        )
                }
            }
            .opacity(onboardingModel.selectedIndex == 0 ? 1 : 0)
            .animation(.easeOut(duration: 0.15), value: onboardingModel.selectedIndex)
            .padding(.bottom, 180)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}

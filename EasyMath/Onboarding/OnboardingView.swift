//
//  Onboarding.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-04.
//

import SwiftUI
import SwiftData

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(OnboardingModel.self) var onboardingModel
    @Environment(MainViewModel.self) private var model
    
    // SwiftData: create, update and persist Profile
    @Environment(\.modelContext) var context
    
    // Fetch all saved profiles from SwiftData
    @Query private var profiles: [Profile]
    
    var body: some View {
        
        @Bindable var onboardingModel = onboardingModel
        
        GeometryReader { proxy in
            ZStack {
                
                TabView(selection: $onboardingModel.selectedIndex) {
                    
                    Onboarding1(actionButton: {
                        // Move to next onboarding step
                        onboardingModel.goNext()
                        
                    })
                    .tag(0)
                    .ignoresSafeArea()
                    
                    Onboarding2(nextButton: {
                        
                        let name = model.name
                            .trimmingCharacters(in: .whitespacesAndNewlines)
                        let finalName = name.isEmpty ? "Name" : name
                        
                        // Create or update profile with onboarding name
                        if profiles.first != nil {
                            let profile = profiles.first!
                            profile.name = finalName
                                .trimmingCharacters(in: .whitespacesAndNewlines)
                        }
                        else {
                            // Create new profile
                            let newProfile = Profile()
                            newProfile.name = finalName
                                .trimmingCharacters(in: .whitespacesAndNewlines)
                            context.insert(newProfile)
                        }
                        
                        do {
                            try context.save()
                        } catch {
                            print("Save error Onboarding2:", error)
                        }
                        
                        // Move to next onboarding step
                        onboardingModel.goNext()
                        
                    }, skipButton: {
                        // Skip onboarding
                        dismiss()
                        
                    })
                    .tag(1)
                    .ignoresSafeArea()
                    
                    Onboarding3(nextButton: {
                        
                        // Save selected onboarding avatar to profile
                        let profile = profiles.first ?? Profile()
                        profile.image = String(onboardingModel.images[onboardingModel.selected ?? 2])
                        
                        if profiles.first == nil {
                            context.insert(profile)
                        }
                        
                        do {
                            try context.save()
                        } catch {
                            print("Save error Onboarding3:", error)
                        }
                        
                        // Move to final onboarding screen
                        dismiss()
                        
                    }, skipButton: {
                        
                        // Skip onboarding
                        dismiss()
                        
                    })
                    .tag(2)
                    .ignoresSafeArea()
                    
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
                .padding(.bottom, 210)
                .offset(y: model.isIPad ? 90 : 0)
                .scaleEffect(model.isIPad ? 0.9 : 1)
                
            }
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.async {
                    if proxy.size.height < 650 {
                        model.isIPad = true
                    }
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}

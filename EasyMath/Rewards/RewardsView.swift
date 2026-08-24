//
//  RewardsView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-07-30.
//

import SwiftUI
import SwiftData

struct RewardsView: View {
    
    @Environment(MainViewModel.self) private var model
    @Environment(RewardsViewModel.self) private var rewardsModel
    @Environment(\.modelContext) private var context
    
    @Query var score: [Score]
    // Fetch all saved profiles from SwiftData
    @Query private var profiles: [Profile]
    @Query var avatarItems: [ItemsOnAvatar]
    
    // Connection to the navigation path from MainView.
    @Binding var path: [Int]
    
    // Track the currently visible card in the horizontal scroll view
    @State private var scrollPosition: Int?
    
    var body: some View {

        GeometryReader { proxy in
            
            let smallScreen = proxy.size.height < 800
            
            ZStack(alignment: .top) {
                
                // Screen background
                Color(red: 251/255, green: 255/255, blue: 255/255)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    // Top navigation bar
                    ZStack {
                        
                        HStack {
                            // Page title
                            Text("Rewards")
                                .foregroundStyle(Color.black)
                                .font(.system(.title2, design: .rounded, weight: .bold))
                            
                        }.frame(maxWidth: .infinity, alignment: .center)
                        
                        HStack {
                            // Back navigation button
                            Button {
                                // Navigate back to Profile View
                                path.append(3)
                                rewardsModel.returnFromRewards = true
                                
                            } label: {
                                Image(systemName: "chevron.left")
                                    .font(.title)
                            }
                            
                            Spacer()
                            
                            // Current score display
                            ScoreBadge()
                        }
                        .foregroundStyle(Color(red: 241/255, green: 1/255, blue: 111/255))
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                    
                    // User profile avatar
                    ProfileAvatar()
                        .scaleEffect(smallScreen ? 0.65 : 0.8)
                        .offset(y: smallScreen ? -40 : 0)
                        .padding(.horizontal, 20)
                    
                    Group {
                        // Rewards selection title
                        Text("Choose an item")
                            .foregroundStyle(Color.black)
                            .font(Font.system(size: smallScreen ? 17 : 18, weight: .bold, design: .rounded))
                            .padding(.top, 20)
                            .padding(.leading, 20)
                        
                        // Available reward items
                        RewardsCardsScroll()
                            .scrollTargetBehavior(.viewAligned)
                            .scrollPosition(id: $scrollPosition)
                        // Update the current page indicator when the scroll position changes
                            .onChange(of: scrollPosition, { _, newValue in
                                if let newValue {
                                    rewardsModel.currentIndex = newValue
                                }
                            })
                            .padding(.bottom, 10)
                        
                        // Page indicators
                        PageIndicator()
                            .offset(y: model.isIPad ? -20 : 0)
                            .padding(.bottom, 20)
                    }
                    .offset(y: model.isIPad ? -150 : smallScreen ? -75 : 0)
                    .scaleEffect(model.isIPad ? 0.9 : 1)

                    Group {
                        // Unlock reward button
                        UnlockRewardsButton(isSmallScreen: smallScreen)
                            .offset(y: model.isIPad ? -185 : smallScreen ? -75 : 0)
                            .disabled(rewardsModel.amountOfStars == nil)
                            .padding(.horizontal, 20)
                        
                        // Banner explaining how to earn stars
                        EarnStarsBanner(isSmallScreen: smallScreen)
                            .offset(y: model.isIPad ? -195 : smallScreen ? -75 : 0)
                            .padding(.top, 10)
                            .padding(.horizontal, 20)
                    }
                    .scaleEffect(model.isIPad ? 0.9 : 1)
                    
                }
                
                // Purchase confirmation overlay
                if rewardsModel.confirmBuyItemWindow {
                    ConfirmationWindow()
                }
            }
            .onAppear(perform: {
                
                DispatchQueue.main.async {
                    print(proxy.size.height)
                }
                
                if rewardsModel.returnFromRewards == false {
                    if let profile = profiles.first {
                        model.selectedImage = profile.image
                    }
                    // Get selected item
                    if let item = avatarItems.first {
                        rewardsModel.selectedItem = item.item
                    }
                }
            })
            .onDisappear(perform: {
                rewardsModel.amountOfStars = nil
            })
            .navigationBarBackButtonHidden(true)
            
        }
    }
    
    func offsetScroll() {
        if model.isIPad {
            
        }
    }
}

#Preview {
    RewardsView(path: .constant([4]))
}

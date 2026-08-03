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
    @Query var score: [Score]
    
    // Connection to the navigation path from MainView.
    @Binding var path: [Int]
    
    var body: some View {
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
                .padding(.bottom, 20)
                
                // User profile avatar
                ProfileAvatar()
                    .scaleEffect(0.8)
                
                // Rewards selection title
                Text("Choose an item")
                    .foregroundStyle(Color.black)
                    .font(Font.system(size: 18, weight: .bold, design: .rounded))
                    .padding(.top, 20)
                
                // Available reward items
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(rewardsModel.cardItems) { item in
                            ItemCard(card: item)
                        }
                    }
                }.padding(.bottom, 30)
                
                // Unlock reward button
                Button {
                    // TODO
                } label: {
                    ZStack {
                        // Background
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 50)
                            .foregroundStyle(RadialGradient(
                                colors: [
                                    Color(red: 255/255, green: 172/255, blue: 31/255),
                                    Color(red: 255/255, green: 163/255, blue: 6/255)
                                ],
                                center: .center,
                                startRadius: 30,
                                endRadius: 70
                            ))
                            .overlay(content: {
                                // Border
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(lineWidth: 0.5)
                                    .foregroundStyle(Color(red: 234/255, green: 127/255, blue: 0/255))
                                    .frame(height: 51)
                            })
                            .shadow(color: Color(red: 238/255, green: 119/255, blue: 4/255), radius: 2, y: 6)
                        
                        HStack {
                            StarIcon(starShadow: 4)
                                .scaleEffect(0.8)
                            
                            Text("Unlock for 120")
                                .foregroundStyle(Color.white)
                                .font(Font.system(size: 20, weight: .bold, design: .rounded))
                        }
                    }
                }
                
                
                // Banner explaining how to earn stars
                EarnStarsBanner()
                    .padding(.top, 10)
                
            }
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RewardsView(path: .constant([4]))
}

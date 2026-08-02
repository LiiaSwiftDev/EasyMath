//
//  RedeemRewardsBanner.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-07-29.
//

import SwiftUI
import SwiftData

struct RedeemRewardsBanner: View {
    
    @Environment(MainViewModel.self) private var model
    @Query var score: [Score]
    
    var body: some View {
        ZStack {
            // Banner background
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 80)
                .foregroundStyle(Color(red: 253/255, green: 249/255, blue: 237/255))
                .overlay {
                    // Border
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(Color(red: 253/255, green: 210/255, blue: 134/255))
                        .frame(height: 80)
                    
                }
            HStack {
                VStack(spacing: 5) {
                    Spacer()
                    
                    // User points section
                    Text("My Points")
                        .foregroundStyle(Color.black)
                        .font(Font.system(size: 15, weight: .medium, design: .rounded))
                        .padding(.leading, 30)
                    
                    HStack {
                        Image("star")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                        
                        // Display current score
                        Text(model.compactNumber(score: score.first?.score ?? 0))
                            .contentTransition(.numericText())
                            .foregroundStyle(Color(red: 255/255, green: 149/255, blue: 13/255))
                            .font(Font.system(size: 24, weight: .bold, design: .rounded))
                            .bold()
                            .padding(.top, 4)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                // Divider between points and rewards
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 1, height: 30)
                    .foregroundStyle(Color(red: 253/255, green: 210/255, blue: 134/255))
                
                Spacer()
                
                // Rewards button
                Button {
                    // TODO
                } label: {
                    VStack(alignment: .leading, spacing: 5) {
                        Spacer()
                        
                        Text("Redeem Rewards")
                            .foregroundStyle(Color.black)
                            .font(Font.system(size: 15, weight: .medium, design: .rounded))
                            .padding(.leading, 15)
                        
                        HStack {
                            Image(systemName: "gift.fill")
                                .font(Font.system(size: 23))
                                .foregroundStyle(Color(red: 255/255, green: 10/255, blue: 122/255))
                            
                            Text("Browse rewards")
                                .foregroundStyle(Color(red: 255/255, green: 10/255, blue: 122/255))
                                .font(Font.system(size: 15, weight: .medium, design: .rounded))
                                .lineLimit(1)
                                .padding(.top, 5)
                                .padding(.trailing, 10)
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color(red: 253/255, green: 210/255, blue: 134/255))
                                .font(.title3)
                                .padding(.top, 6)
                        }
                        Spacer()
                    }
                    .padding(.trailing, 30)
                }
                
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}

#Preview {
    RedeemRewardsBanner()
}

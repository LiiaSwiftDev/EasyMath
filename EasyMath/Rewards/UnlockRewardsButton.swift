//
//  UnlockRewardsButton.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-08-05.
//

import SwiftUI
import SwiftData

struct UnlockRewardsButton: View {
    
    @Environment(RewardsViewModel.self) private var rewardsModel
    @Environment(\.modelContext) private var context
    
    @Query var scores: [Score]
    
    @State var showAlert = false
    
    var body: some View {
        
        // Unlock reward button
        Button {
            buySelectedItem()
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
                    
                    // Display the unlock price
                    Text(rewardsModel.textOnTheButton(text: rewardsModel.amountOfStars))
                        .foregroundStyle(Color.white)
                        .font(Font.system(size: 20, weight: .bold, design: .rounded))
                }
            }
        }
        // Show an alert when the user does not have enough stars
        .alert("Not enough stars!", isPresented: $showAlert) {
            Button("OK", role: .cancel, action: {})
        }
    }
    
    // Check the user's stars and open the purchase confirmation window
    func buySelectedItem() {

        if let score = scores.first {
            // Check whether the user has enough stars to buy the selected item
            if let price = Int(rewardsModel.amountOfStars ?? "0"), score.score >= price {
                
                rewardsModel.confirmBuyItemWindow = true
            } else {
                print("No enough stars!")
                
                // Show an alert when the user does not have enough stars
                showAlert = true
            }
        } else {
            print("No score here yet.")
            
            // Show an alert when no score is available
            showAlert = true
        }
    }
}

#Preview {
    UnlockRewardsButton()
}

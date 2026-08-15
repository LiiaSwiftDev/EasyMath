//
//  ConfirmationWindow.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-08-14.
//

import SwiftUI
import SwiftData

struct ConfirmationWindow: View {
    
    @Environment(RewardsViewModel.self) private var rewardsModel
    @Environment(\.modelContext) private var context
    
    @Query var score: [Score]
    
    var body: some View {
        // Purchase confirmation overlay
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Close purchase confirmation window
                HStack(spacing: 0) {
                    Button {
                        // Cancel
                        rewardsModel.confirmBuyItemWindow = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundStyle(Color(red: 127/255, green: 132/255, blue: 153/255))
                            .opacity(0.7)
                            .padding(.leading, 20)
                            .padding(.top, 20)
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 5)
                
                // Get the name of the selected reward item
                let itemName = rewardsModel.getNameOfItem()
                
                // Purchase confirmation message
                Text("Buy \(itemName) for \(rewardsModel.amountOfStars ?? "") Stars? ")
                    .foregroundStyle(Color(red: 127/255, green: 132/255, blue: 153/255))
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 60)
                
                Spacer(minLength: 0)
                
                // Selected reward item preview
                Image(rewardsModel.selectedImageInWindow ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 100)
                    .offset(y: rewardsModel.educationHatInWindow
                            ? 5 : 0)
                
                Spacer(minLength: 0)
                
                // Buy item button
                Button {
                    if let price = Int(rewardsModel.amountOfStars ?? "0"),
                       let currentScore = score.first,
                       let selectedItem = rewardsModel.selectedItem {
                        
                        // Deduct the item price from the current score
                        withAnimation(.snappy) {
                            currentScore.score -= price
                        }
                        
                        // Add the purchased item to SwiftData
                        let newItem = OwnedItem(soldItem: selectedItem)
                        context.insert(newItem)
                        
                        do {
                            try context.save()
                        } catch {
                            print("Save error: \(error)")
                        }
                    }
                    
                    rewardsModel.confirmBuyItemWindow = false
                    rewardsModel.amountOfStars = nil
                    
                } label: {
                    ZStack {
                        Capsule()
                            .frame(width: 80, height: 34)
                            .foregroundStyle(Color(red: 241/255, green: 1/255, blue: 111/255))
                            .overlay {
                                Capsule()
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(Color(red: 206/255, green: 43/255, blue: 105/255))
                            }
                        
                        Text("Buy")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 16, weight: .medium))
                        
                    }
                }
                .padding(.bottom, 40)
                
            }
            .frame(height: 300)
            .background(Color(red: 251/255, green: 255/255, blue: 255/255))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    ConfirmationWindow()
}

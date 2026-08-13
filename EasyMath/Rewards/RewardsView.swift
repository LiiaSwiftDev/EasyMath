//
//  RewardsView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-07-30.
//

import SwiftUI
import SwiftData
import AVFoundation

struct RewardsView: View {
    
    @Environment(MainViewModel.self) private var model
    @Environment(RewardsViewModel.self) private var rewardsModel
    @Environment(\.modelContext) private var context
    
    @Query var score: [Score]
    // Fetch all saved profiles from SwiftData
    @Query private var profiles: [Profile]
    @Query var avatarItems: [ItemsOnAvatar]
    @Query var soldItems: [OwnedItem]
    
    // Connection to the navigation path from MainView.
    @Binding var path: [Int]
    
    @State private var audioPlayer: AVAudioPlayer?
    
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
                    .scaleEffect(0.8)
                    .padding(.horizontal, 20)
                
                // Rewards selection title
                Text("Choose an item")
                    .foregroundStyle(Color.black)
                    .font(Font.system(size: 18, weight: .bold, design: .rounded))
                    .padding(.top, 20)
                    .padding(.leading, 20)
                
                // Available reward items
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(rewardsModel.cardItems) { item in
                            
                            // Special case for boy4 ski glasses
                            let currentItem = model.selectedImage == "boy4" && item.image == "ski-glasses" ? "ski-glasses2" : item.image
                            
                            let isOwned = soldItems.contains { soldItem in
                                soldItem.soldItem == currentItem
                            }
                            
                            
                            ItemCard(card: item, buttonAction: {
                                playSoundClick()
                                
                                rewardsModel.amountOfStars = item.price
                                
                                // If the item is already selected, deselect it
                                if rewardsModel.selectedItem == currentItem {
                                    removeItem()
                                } else {
                                    // Otherwise, select the item
                                    rewardsModel.selectedItem = currentItem
                                }
                                
                                // Save the image that will be displayed in the purchase window
                                rewardsModel.selectedImageInWindow = item.image
                                
                                // Adjust the graduation cap position in the purchase window
                                if item.image == "cap" {
                                    rewardsModel.educationHatInWindow = true
                                } else {
                                    rewardsModel.educationHatInWindow = false
                                }
                                
                            }, selectedItem: rewardsModel.selectedItem == currentItem, soldItem: isOwned)
                        }
                    }
                    .padding(.horizontal, 20)
                }.padding(.bottom, 30)
                
                // Unlock reward button
                UnlockRewardsButton()
                    .disabled(rewardsModel.amountOfStars == nil)
                    .padding(.horizontal, 20)
                
                // Banner explaining how to earn stars
                EarnStarsBanner()
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                
            }
            
            if rewardsModel.confirmBuyItemWindow {
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
        .onAppear(perform: {
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
    
    func removeItem() {
        rewardsModel.selectedItem = nil
        rewardsModel.amountOfStars = nil
        
        // Remove previously saved avatar items
        for itemStorage in avatarItems {
            context.delete(itemStorage)
        }
    }
    
    func playSoundClick() {
        
        guard let url = Bundle.main.url(forResource: "universfield-bubble-pop-04-323580", withExtension: "mp3") else {
            return
        }
        
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
    }
    
}

#Preview {
    RewardsView(path: .constant([4]))
}

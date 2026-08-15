//
//  RewardsCardsView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-08-14.
//

import SwiftUI
import SwiftData
import AVFoundation

struct RewardsCardsView: View {
    
    @Environment(MainViewModel.self) private var model
    @Environment(RewardsViewModel.self) private var rewardsModel
    @Environment(\.modelContext) private var context
    
    @Query var soldItems: [OwnedItem]
    @Query var avatarItems: [ItemsOnAvatar]
    
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        // Available reward items
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(Array(rewardsModel.cardItems.enumerated()), id: \.offset) { index, item in
                    
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
                    .id(index)
                    
                }
            }
            .scrollTargetLayout()
            .padding(.horizontal, 20)
        }
    }
    
    func playSoundClick() {
        
        guard let url = Bundle.main.url(forResource: "universfield-bubble-pop-04-323580", withExtension: "mp3") else {
            return
        }
        
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
    }
    
    func removeItem() {
        rewardsModel.selectedItem = nil
        rewardsModel.amountOfStars = nil
        
        // Remove previously saved avatar items
        for itemStorage in avatarItems {
            context.delete(itemStorage)
        }
    }
}

#Preview {
    RewardsCardsView()
}

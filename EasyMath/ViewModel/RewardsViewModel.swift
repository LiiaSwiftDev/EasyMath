//
//  RewardsViewModel.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-08-01.
//

import Foundation
import SwiftUI

@Observable
class RewardsViewModel {
    
    // Track the currently visible reward card
    var currentIndex = 0
    // Image displayed in the purchase confirmation window
    var selectedImageInWindow: String?
    
    // Indicates whether the selected item is a graduation cap
    var educationHatInWindow = false
    
    // Controls the visibility of the purchase confirmation window
    var confirmBuyItemWindow = false
    
    // Price of the selected reward item
    var amountOfStars: String?
    
    // Currently selected reward item
    var selectedItem: String?
    
    var returnFromRewards = false
    
    // Return the appropriate button text based on the selected item's price
    func textOnTheButton(text: String?) -> String {
        if text == nil {
            return "Unlock"
        } else {
            return "Unlock for \(text!)"
        }
    }
    
    // Get the display name of the selected reward item
    func getNameOfItem() -> String {
        if let selected = selectedItem {
            switch selected {
            case "bow-tie-purple":
                return "Purple Bow Tie"
            case "crown":
                return "Crown"
            case "sunglasses":
                return "Blue Sunglasses"
            case "cap":
                return "Graduation Cap"
            case "ski-glasses":
                return "Orange Ski Goggles"
            case "ski-glasses2":
                return "Orange Ski Goggles"
            case "bow-tie-red":
                return "Red Bow Tie"
            case "hat":
                return "Brown Hat"
            case "rounded-glasses":
                return "Rounded Glasses"
            default:
                return "This Item"
            }
        }
        
        return ""
    }
    
    // Data for reward item cards
    var cardItems = [
        ItemCardModel(
            image: "bow-tie-purple",
            widthImage: 70,
            colorItemBg: Color(red: 249/255, green: 237/255, blue: 175/255),
            price: "1"),
        ItemCardModel(
            image: "crown",
            widthImage: 70,
            colorItemBg: Color(red: 236/255, green: 85/255, blue: 100/255),
            price: "2"),
        ItemCardModel(
            image: "sunglasses",
            widthImage: 80,
            colorItemBg: Color(red: 201/255, green: 220/255, blue: 162/255),
            price: "3"),
        ItemCardModel(
            image: "cap",
            widthImage: 130,
            colorItemBg: Color(red: 185/255, green: 175/255, blue: 236/255),
            price: "4"),
        ItemCardModel(
            image: "ski-glasses",
            widthImage: 140,
            colorItemBg: Color(red: 249/255, green: 237/255, blue: 175/255),
            price: "3"),
        ItemCardModel(
            image: "bow-tie-red",
            widthImage: 60,
            colorItemBg: Color(red: 183/255, green: 204/255, blue: 255/255),
            price: "1"),
        ItemCardModel(
            image: "hat",
            widthImage: 80,
            colorItemBg: Color(red: 201/255, green: 220/255, blue: 162/255),
            price: "2"),
        ItemCardModel(
            image: "rounded-glasses",
            widthImage: 110,
            colorItemBg: Color(red: 255/255, green: 236/255, blue: 207/255),
            price: "4")
    ]
    
    // Display settings for each avatar and reward item combination
    let itemSettings: [ItemSettings] = [
        // Curly-haired boy
        ItemSettings(avatar: "boy1", item: "bow-tie-purple", widthItem: 50, offsetItem: CGSize(width: 0, height: 70)),
        ItemSettings(avatar: "boy1", item: "crown", widthItem: 70, offsetItem: CGSize(width: 0, height: -70)),
        ItemSettings(avatar: "boy1", item: "sunglasses", widthItem: 100, offsetItem: CGSize(width: 0, height: 8)),
        ItemSettings(avatar: "boy1", item: "cap", widthItem: 100, offsetItem: CGSize(width: 0, height: -60)),
        ItemSettings(avatar: "boy1", item: "ski-glasses", widthItem: 170, offsetItem: CGSize(width: 0, height: -2)),
        ItemSettings(avatar: "boy1", item: "bow-tie-red", widthItem: 50, offsetItem: CGSize(width: 0, height: 67)),
        ItemSettings(avatar: "boy1", item: "hat", widthItem: 130, offsetItem: CGSize(width: 0, height: -70)),
        ItemSettings(avatar: "boy1", item: "rounded-glasses", widthItem: 130, offsetItem: CGSize(width: 0, height: 8)),
        // Girl with a pink flower
        ItemSettings(avatar: "girl1", item: "bow-tie-purple", widthItem: 50, offsetItem: CGSize(width: 0, height: 70)),
        ItemSettings(avatar: "girl1", item: "crown", widthItem: 70, offsetItem: CGSize(width: 0, height: -70)),
        ItemSettings(avatar: "girl1", item: "sunglasses", widthItem: 100, offsetItem: CGSize(width: 0, height: 8)),
        ItemSettings(avatar: "girl1", item: "cap", widthItem: 100, offsetItem: CGSize(width: 0, height: -60)),
        ItemSettings(avatar: "girl1", item: "ski-glasses", widthItem: 170, offsetItem: CGSize(width: 0, height: -2)),
        ItemSettings(avatar: "girl1", item: "bow-tie-red", widthItem: 50, offsetItem: CGSize(width: 0, height: 67)),
        ItemSettings(avatar: "girl1", item: "hat", widthItem: 130, offsetItem: CGSize(width: 0, height: -70)),
        ItemSettings(avatar: "girl1", item: "rounded-glasses", widthItem: 130, offsetItem: CGSize(width: 0, height: 8)),
        // Red-haired boy
        ItemSettings(avatar: "boy2", item: "bow-tie-purple", widthItem: 50, offsetItem: CGSize(width: 0, height: 70)),
        ItemSettings(avatar: "boy2", item: "crown", widthItem: 70, offsetItem: CGSize(width: 0, height: -70)),
        ItemSettings(avatar: "boy2", item: "sunglasses", widthItem: 100, offsetItem: CGSize(width: 0, height: 8)),
        ItemSettings(avatar: "boy2", item: "cap", widthItem: 100, offsetItem: CGSize(width: 0, height: -60)),
        ItemSettings(avatar: "boy2", item: "ski-glasses", widthItem: 170, offsetItem: CGSize(width: 0, height: -2)),
        ItemSettings(avatar: "boy2", item: "bow-tie-red", widthItem: 50, offsetItem: CGSize(width: 0, height: 67)),
        ItemSettings(avatar: "boy2", item: "hat", widthItem: 130, offsetItem: CGSize(width: 0, height: -70)),
        ItemSettings(avatar: "boy2", item: "rounded-glasses", widthItem: 130, offsetItem: CGSize(width: -2, height: 8)),
        // Girl with brown hair and orange dress
        ItemSettings(avatar: "girl2", item: "bow-tie-purple", widthItem: 50, offsetItem: CGSize(width: 0, height: 70)),
        ItemSettings(avatar: "girl2", item: "crown", widthItem: 70, offsetItem: CGSize(width: 0, height: -60)),
        ItemSettings(avatar: "girl2", item: "sunglasses", widthItem: 95, offsetItem: CGSize(width: 0, height: 8)),
        ItemSettings(avatar: "girl2", item: "cap", widthItem: 100, offsetItem: CGSize(width: 0, height: -60)),
        ItemSettings(avatar: "girl2", item: "ski-glasses", widthItem: 170, offsetItem: CGSize(width: 0, height: -2)),
        ItemSettings(avatar: "girl2", item: "bow-tie-red", widthItem: 50, offsetItem: CGSize(width: 0, height: 67)),
        ItemSettings(avatar: "girl2", item: "hat", widthItem: 120, offsetItem: CGSize(width: 0, height: -70)),
        ItemSettings(avatar: "girl2", item: "rounded-glasses", widthItem: 130, offsetItem: CGSize(width: 0, height: 8)),
        // Blonde girl
        ItemSettings(avatar: "girl3", item: "bow-tie-purple", widthItem: 50, offsetItem: CGSize(width: 0, height: 70)),
        ItemSettings(avatar: "girl3", item: "crown", widthItem: 60, offsetItem: CGSize(width: 0, height: -69)),
        ItemSettings(avatar: "girl3", item: "sunglasses", widthItem: 100, offsetItem: CGSize(width: 0, height: 8)),
        ItemSettings(avatar: "girl3", item: "cap", widthItem: 100, offsetItem: CGSize(width: 0, height: -60)),
        ItemSettings(avatar: "girl3", item: "ski-glasses", widthItem: 170, offsetItem: CGSize(width: 0, height: -2)),
        ItemSettings(avatar: "girl3", item: "bow-tie-red", widthItem: 50, offsetItem: CGSize(width: 0, height: 67)),
        ItemSettings(avatar: "girl3", item: "hat", widthItem: 120, offsetItem: CGSize(width: 0, height: -70)),
        ItemSettings(avatar: "girl3", item: "rounded-glasses", widthItem: 130, offsetItem: CGSize(width: 0, height: 8)),
        // Boy with blue hair
        ItemSettings(avatar: "boy3", item: "bow-tie-purple", widthItem: 50, offsetItem: CGSize(width: 0, height: 70)),
        ItemSettings(avatar: "boy3", item: "crown", widthItem: 70, offsetItem: CGSize(width: 0, height: -70)),
        ItemSettings(avatar: "boy3", item: "sunglasses", widthItem: 100, offsetItem: CGSize(width: 0, height: 8)),
        ItemSettings(avatar: "boy3", item: "cap", widthItem: 100, offsetItem: CGSize(width: 0, height: -60)),
        ItemSettings(avatar: "boy3", item: "ski-glasses", widthItem: 170, offsetItem: CGSize(width: 0, height: -2)),
        ItemSettings(avatar: "boy3", item: "bow-tie-red", widthItem: 50, offsetItem: CGSize(width: 0, height: 67)),
        ItemSettings(avatar: "boy3", item: "hat", widthItem: 130, offsetItem: CGSize(width: 0, height: -75)),
        ItemSettings(avatar: "boy3", item: "rounded-glasses", widthItem: 130, offsetItem: CGSize(width: 0, height: 8)),
        // Black girl
        ItemSettings(avatar: "girl4", item: "bow-tie-purple", widthItem: 50, offsetItem: CGSize(width: 0, height: 79)),
        ItemSettings(avatar: "girl4", item: "crown", widthItem: 60, offsetItem: CGSize(width: 0, height: -50)),
        ItemSettings(avatar: "girl4", item: "sunglasses", widthItem: 100, offsetItem: CGSize(width: 0, height: 20)),
        ItemSettings(avatar: "girl4", item: "cap", widthItem: 100, offsetItem: CGSize(width: 0, height: -40)),
        ItemSettings(avatar: "girl4", item: "ski-glasses", widthItem: 160, offsetItem: CGSize(width: 0, height: 8)),
        ItemSettings(avatar: "girl4", item: "bow-tie-red", widthItem: 50, offsetItem: CGSize(width: 0, height: 77)),
        ItemSettings(avatar: "girl4", item: "hat", widthItem: 130, offsetItem: CGSize(width: 0, height: -60)),
        ItemSettings(avatar: "girl4", item: "rounded-glasses", widthItem: 130, offsetItem: CGSize(width: 0, height: 18)),
        // Boy with headphones
        ItemSettings(avatar: "boy4", item: "bow-tie-purple", widthItem: 50, offsetItem: CGSize(width: 0, height: 70)),
        ItemSettings(avatar: "boy4", item: "crown", widthItem: 70, offsetItem: CGSize(width: 0, height: -70)),
        ItemSettings(avatar: "boy4", item: "sunglasses", widthItem: 100, offsetItem: CGSize(width: 0, height: 8)),
        ItemSettings(avatar: "boy4", item: "cap", widthItem: 100, offsetItem: CGSize(width: 0, height: -60)),
        ItemSettings(avatar: "boy4", item: "ski-glasses2", widthItem: 190, offsetItem: CGSize(width: 0, height: -2)),
        ItemSettings(avatar: "boy4", item: "bow-tie-red", widthItem: 50, offsetItem: CGSize(width: 0, height: 67)),
        ItemSettings(avatar: "boy4", item: "hat", widthItem: 130, offsetItem: CGSize(width: 0, height: -70)),
        ItemSettings(avatar: "boy4", item: "rounded-glasses", widthItem: 130, offsetItem: CGSize(width: 0, height: 8)),
        
    ]
    
}

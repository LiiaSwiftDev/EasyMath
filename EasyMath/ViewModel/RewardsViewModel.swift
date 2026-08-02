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
    
    // Data for reward item cards
    var cardItems = [
        ItemCardModel(image: "bow-tie-purple", widthImage: 70, colorItemBg: Color(red: 249/255, green: 237/255, blue: 175/255), price: "100"),
        ItemCardModel(image: "crown", widthImage: 70, colorItemBg: Color(red: 236/255, green: 85/255, blue: 100/255), price: "120"),
        ItemCardModel(image: "sunglasses", widthImage: 80, colorItemBg: Color(red: 201/255, green: 220/255, blue: 162/255), price: "80"),
        ItemCardModel(image: "cap", widthImage: 70, colorItemBg: Color(red: 185/255, green: 175/255, blue: 236/255), price: "100"),
        ItemCardModel(image: "ski-glasses", widthImage: 120, colorItemBg: Color(red: 249/255, green: 237/255, blue: 175/255), price: "120"),
        ItemCardModel(image: "bow-tie-red", widthImage: 60, colorItemBg: Color(red: 201/255, green: 220/255, blue: 162/255), price: "100"),
        ItemCardModel(image: "hat", widthImage: 80, colorItemBg: Color(red: 201/255, green: 215/255, blue: 255/255), price: "80"),
        ItemCardModel(image: "rounded-glasses", widthImage: 110, colorItemBg: Color(red: 255/255, green: 236/255, blue: 207/255), price: "80")
    ]
    
}

//
//  ItemCard.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-07-30.
//

import SwiftUI

struct ItemCard: View {
    
    var card: ItemCardModel
    var buttonAction: () -> Void
    
    var selectedItem: Bool
    
    var body: some View {
        // Reward item button
        Button {
            buttonAction()
        } label: {
            ZStack {
                
                // Card background
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 110, height: 160)
                    .foregroundStyle(card.colorItemBg)
                    .overlay {
                        // Card border
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2)
                            .frame(width: 114, height: 164)
                            .foregroundStyle(selectedItem ? .pink : .clear)
                            .shadow(color: selectedItem ? .clear : .black.opacity(0.2), radius: selectedItem ? 0 : 2, x: 0, y: 0)
                    }
                VStack {
                    Spacer()
                    
                    // Reward item image
                    Image(card.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: card.widthImage)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    // Price section
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 110, height: 50)
                            .clipShape(UnevenRoundedRectangle(
                                bottomLeadingRadius: 15,
                                bottomTrailingRadius: 15
                            ))
                        
                        HStack(spacing: 2) {
                            Spacer(minLength: 0)
                            
                            StarIcon(starShadow: 0)
                                .scaleEffect(0.65)
                            
                            
                            Text(card.price)
                                .foregroundStyle(Color.brown)
                                .font(Font.system(size: 21, weight: .bold, design: .rounded))
                            
                            Spacer(minLength: 0)
                        }
                        .padding(.trailing, 4)
                    }
                }
                .frame(width: 110, height: 160)
                
            }
                .frame(width: 114, height: 164)
                .padding(.vertical, 3)
                .padding(.horizontal, 3)
        }
        
    }
}

#Preview {
    ItemCard(card: ItemCardModel(image: "crown", widthImage: 70, colorItemBg: Color(red: 223/255, green: 220/255, blue: 245/255), price: "80"), buttonAction: {}, selectedItem: true)
}

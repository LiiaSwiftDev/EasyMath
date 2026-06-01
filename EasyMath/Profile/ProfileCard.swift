//
//  ProfileCard.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-20.
//

import SwiftUI

struct ProfileCard: View {
    
    var image: String
    var width: CGFloat
    
    var selected: Bool
    let onTap: () -> Void
    
    var body: some View {
        
        // Prevent crashes if width is 0 or negative.
        let safeWidth = max(width, 10)
        
        // Card proportions.
        let height = safeWidth * 1.2
        let imageHeight = height * 0.8
        let girlHeight = height * 0.7
        
        Button {
            
            onTap()
            
        } label: {
            
            return ZStack {
                Ellipse()
                    .foregroundStyle(Color.white)
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: image == "girl4" ? girlHeight : imageHeight)
                    .offset(y: image == "girl4" ? 15 : 10)
            }
            // Overall card size.
            .frame(width: safeWidth, height: height)
            // Stroke around the card.
            .overlay {
                Ellipse()
                    .stroke(selected ? Color(red: 128/255, green: 220/255, blue: 129/255) : .gray.opacity(0.2), lineWidth: 2)
                    .frame(width: safeWidth - 2, height: height - 2)
                
                
            }
            // Clip everything outside the ellipse shape.
            .clipShape(Ellipse())
        }
    }
}

#Preview {
    ProfileCard(image: "boy2", width: 80, selected: true, onTap: {
        // nothing
    })
}

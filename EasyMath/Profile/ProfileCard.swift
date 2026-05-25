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
    
    var body: some View {
        
        // Prevent crashes if width is 0 or negative.
        let safeWidth = max(width, 10)
        
        // Card proportions.
        let height = safeWidth * 1.2
        let imageHeight = height * 1.2
        
        return ZStack {
            Ellipse()
                .foregroundStyle(Color.white)
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: imageHeight)
                .offset(y: 15)
        }
        // Overall card size.
        .frame(width: safeWidth, height: height)
        // Stroke around the card.
        .overlay {
            Ellipse()
                .stroke(lineWidth: 2)
        }
        // Clip everything outside the ellipse shape.
        .clipShape(Ellipse())
    }
}

#Preview {
    ProfileCard(image: "test1", width: 80)
}

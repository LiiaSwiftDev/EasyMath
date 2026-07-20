//
//  ProfileCard.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-20.
//

import SwiftUI

struct ProfileCard: View {
    
    @Environment(MainViewModel.self) var model
    
    var image: String
    var width: CGFloat
    var background: Color
    var selected: Bool
    
    // Action when card is tapped
    let onTap: () -> Void
    
    @State private var scaleAvatar: CGFloat = 1
    
    var body: some View {
        
        // Prevent crashes if width is 0 or negative.
        let safeWidth = max(width, 10)
        
        // Card proportions.
        let height = safeWidth * 1.2
        let imageHeight = height * 0.8
        let girlHeight = height * 0.7
        
        Button {
            
            // Shrink avatar
            withAnimation(.easeIn(duration: 0.2)) {
                scaleAvatar = 0.85
            }
            
            // Expand avatar
            withAnimation(.easeOut(duration: 0.3).delay(0.12)) {
                scaleAvatar = 1.1
            }
            
            // Return to normal size
            withAnimation(.easeIn(duration: 0.35).delay(0.17)) {
                scaleAvatar = 1.0
            }
            
            onTap()
            
        } label: {
            
            return ZStack {
                
                // Card background
                Ellipse()
                    .foregroundStyle(background)
                
                // Profile image
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: image == "girl4" ? girlHeight : imageHeight)
                    .offset(y: image == "girl4" ? 15 : 10)
            }
            // Overall card size.
            .frame(width: safeWidth, height: height)
            
            // Selection border
            .overlay {
                Ellipse()
                    .stroke(selected ? Color(red: 241/255, green: 1/255, blue: 111/255) : .clear, lineWidth: 2)
                    .frame(width: safeWidth - 2, height: height - 2)
                
                
            }
            // Clip everything outside the ellipse shape
            .clipShape(Ellipse())
            
        }
        .buttonStyle(.plain)
        
        // Tap animation
        .scaleEffect(scaleAvatar)
    }
}

#Preview {
    ProfileCard(image: "boy2", width: 80, background: .blue, selected: true, onTap: {
        // nothing
    })
}

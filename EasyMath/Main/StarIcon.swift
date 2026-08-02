//
//  StarIcon.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-07-31.
//

import SwiftUI

struct StarIcon: View {
    
    var starShadow: CGFloat
    
    var body: some View {
        // Star icon
        ZStack {
            Circle()
                .shadow(radius: 4, x: starShadow)
                .frame(height: 40)
                .foregroundStyle(Color(red: 253/255, green: 241/255, blue: 187/255))
                .overlay {
                    Circle()
                        .stroke(lineWidth: 3)
                        .foregroundStyle(Color(red: 254/255, green: 162/255, blue: 28/255))
                }
            
            Image("star")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
            
        }
    }
}

#Preview {
    StarIcon(starShadow: 4)
}

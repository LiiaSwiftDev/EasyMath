//
//  ProfileCard.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-04-28.
//

import SwiftUI

struct ProfileCard: View {
    var body: some View {
        ZStack {
            // Background capsule
            Capsule()
                .frame(width: 120, height: 30)
                .foregroundStyle(Color(red: 219/255, green: 76/255, blue: 77/255))
                .shadow(radius: 4, y: 4)
            
            // Username
            Text("Mike")
                .foregroundStyle(Color.white)
                .font(Font.system(size: 18, design: .rounded))
                .bold()
                .padding(.leading, 45)
            
            // Avatar background circle
            Circle()
                .foregroundStyle(Color.orange)
                .frame(height: 66)
                .overlay {
                    Circle()
                        .stroke(lineWidth: 1)
                        .frame(height: 67)
                        .foregroundStyle(Color.white)
                }
                .padding(.trailing, 80)
            
            // Profile image
            Image("boy")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 51)
                .padding(.trailing, 80)
                .padding(.bottom, 2)
        }
    }
}

#Preview {
    ProfileCard()
}

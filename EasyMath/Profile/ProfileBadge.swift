//
//  ProfileCard.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-04-28.
//

import SwiftUI
import SwiftData

struct ProfileBadge: View {
    
    @Environment(MainViewModel.self) var model
    @Environment(\.modelContext) var context
    
    @Query private var profiles: [Profile]
    
    var body: some View {
        ZStack {
            // Background capsule
            Capsule()
                .frame(width: 140, height: 30)
                .foregroundStyle(Color(red: 219/255, green: 76/255, blue: 77/255))
                .shadow(radius: 4, y: 4)
            HStack {
                ZStack {
                    // Avatar background circle
                    Circle()
                        .foregroundStyle(Color(red: 255/255, green: 225/255, blue: 178/255))
                    
                    // Profile image
                    Image(profiles.first?.image ?? "boy4")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: profiles.first?.image == "girl4" ? 48 : 52)
                        .padding(.top, 15)
                }
                .frame(height: 66)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(lineWidth: 3)
                        .frame(height: 67)
                        .foregroundStyle(Color.white)
                }
                
                Spacer(minLength: 0)
                
                // Username
                Text(profiles.first?.name ?? "Name")
                    .foregroundStyle(Color.white)
                    .font(Font.system(size: 18, design: .rounded))
                    .bold()
                    .padding(.trailing)
                
                Spacer(minLength: 0)
            }
            .frame(width: 160)
        }
    }
}

#Preview {
    ProfileBadge()
}

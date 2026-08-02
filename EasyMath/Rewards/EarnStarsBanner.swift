//
//  EarnStarsBanner.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-07-30.
//

import SwiftUI

struct EarnStarsBanner: View {
    var body: some View {
        // Banner explaining how to earn stars and unlock rewards
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 130)
                .foregroundStyle(Color(red: 243/255, green: 243/255, blue: 254/255))
            HStack {
                // Reward illustration
                Image("gift")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.trailing, 20)
                
                // Banner text
                VStack(alignment: .leading, spacing: 5) {
                    Text("Need more stars?")
                        .foregroundStyle(Color(red: 39/255, green: 38/255, blue: 71/255))
                        .font(Font.system(size: 18, weight: .bold, design: .rounded))
                    
                    Text("Earn stars by solving math\nproblems and collect fun\nrewards.")
                        .foregroundStyle(Color(red: 48/255, green: 47/255, blue: 89/255))
                        .font(Font.system(size: 15, weight: .medium, design: .rounded))
                        .padding(.trailing, 10)
                }
            }
        }
    }
}

#Preview {
    EarnStarsBanner()
}

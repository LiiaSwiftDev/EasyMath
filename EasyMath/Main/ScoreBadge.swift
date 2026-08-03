//
//  ScoreBadge.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-08-01.
//

import SwiftUI
import SwiftData

struct ScoreBadge: View {
    @Environment(MainViewModel.self) var model
    @Query var score: [Score]
    
    var body: some View {
        ZStack {
            // Background capsule
            Capsule()
                .frame(width: 110, height: 35)
                .foregroundStyle(Color(red: 250/255, green: 131/255, blue: 2/255))
                .shadow(radius: 4, y: 4)
            
            HStack {
                
                // Star icon
                StarIcon(starShadow: 4)
                
                Spacer()
                
                // Score value
                Text(model.compactNumber(score: score.first?.score ?? 0))
                    .contentTransition(.numericText())
                    .foregroundStyle(Color.white)
                    .font(Font.system(size: 20, design: .rounded))
                    .bold()
                
                Spacer()
                
            }
        }.frame(width: 110)
    }
}

#Preview {
    ScoreBadge()
}

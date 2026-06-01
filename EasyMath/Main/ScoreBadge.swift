//
//  ScoreBadge.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-01.
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
                ZStack {
                    Circle()
                        .shadow(radius: 4, x: 4)
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
                
                Spacer()
                
                // Score value
                Text(model.compactNumber(score: score.first?.score ?? 0))
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

//
//  ScoreBadge.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-01.
//

import SwiftUI
import SwiftData

struct ScoreBadge: View {
    
    @Query var score: [Score]
    
    var body: some View {
        ZStack {
            // Background capsule
            Capsule()
                .frame(width: 107, height: 30)
                .foregroundStyle(Color(red: 250/255, green: 131/255, blue: 2/255))
                .shadow(radius: 4, y: 4)
            
            HStack {
                // Star image
                Image("star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 53, height: 53)
                    .padding(.bottom, 1)
                
                Spacer()
                
                // Score value
                Text("\(score.first?.score ?? 0)")
                    .foregroundStyle(Color.white)
                    .font(Font.system(size: 20, design: .rounded))
                    .bold()
                    .frame(alignment: .center)
                    .padding(.trailing, 20)
                
                Spacer()
            }
        } .frame(width: 125)
    }
}

#Preview {
    ScoreBadge()
}

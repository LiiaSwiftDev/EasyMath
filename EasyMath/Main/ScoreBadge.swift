//
//  ScoreBadge.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-01.
//

import SwiftUI

struct ScoreBadge: View {
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
                Text("43")
                    .foregroundStyle(Color.white)
                    .font(Font.system(size: 18, design: .rounded))
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

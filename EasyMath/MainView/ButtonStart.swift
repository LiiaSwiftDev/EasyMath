//
//  ButtonStart.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-04-22.
//

import SwiftUI

struct ButtonStart: View {
    
    var shadow: Color
    
    var body: some View {
        ZStack {
            // Main button background
            Circle()
                .frame(height: 35)
                .foregroundStyle(Color(red: 254/255, green:  209/255, blue: 87/255))
                .shadow(color: shadow, radius: 0, x: 1, y: 4)
                .shadow(color: shadow, radius: 0, x: -2)
            
            // Button border
            Circle()
                .stroke(Color(red: 251/255, green: 189/255, blue: 95/255), lineWidth: 2)
                .frame(height: 37)
            
            // Arrow icon inside button
            Image("chevron")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 25)
                .padding(.leading, 4)
            
        }.frame(height: 37)
    }
}
#Preview {
    ButtonStart(shadow: Color.red)
}

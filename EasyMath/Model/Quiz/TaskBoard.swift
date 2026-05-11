//
//  TaskBoard.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-07.
//

import SwiftUI

struct TaskBoard: View {
    var body: some View {
        ZStack {
            // Board background
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 270)
                .foregroundStyle(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 0)
            
            // Vertical lines
            HStack {
                Rectangle()
                    .foregroundStyle(Color.black)
                    .frame(width: 1)
                
                Spacer()
                
                Rectangle()
                    .foregroundStyle(Color.black)
                    .frame(width: 1)
                
            }.padding(.horizontal, 26)
            
            // Horizontal lines
            VStack {
                Rectangle()
                    .foregroundStyle(Color.black)
                    .frame(height: 1)
                
                Spacer()
                
                Rectangle()
                    .foregroundStyle(Color.black)
                    .frame(height: 1)
            }.padding(.vertical, 52)
            
            // Example to solve
            Text("5 x 3 = ?")
                .foregroundStyle(Color.black)
                .font(.system(.largeTitle, design: .rounded, weight: .semibold))
            
            // Decorative lion image
            Image("lion")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 170)
                .offset(x: -70, y: -130)
                .rotationEffect(.degrees(-13))
            
        }.frame( height: 270)
            .padding(.horizontal, 40)
    }
}

#Preview {
    TaskBoard()
}

//
//  HomeButton.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-10.
//

import SwiftUI

struct HomeButton: View {
    
    // Connection to the navigation path from MainView.
    @Binding var path: [Int]
    
    var body: some View {
        // Home button
        Button {
            // Clears the navigation path and returns to the main screen.
            path.removeAll()
            
        } label: {
            ZStack {
                // Background
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 50)
                    .foregroundStyle(Color.white)
                    .shadow(radius: 2, y: 6)
                    .shadow(color: .black.opacity(0.1),radius: 2, x: 0, y: 0)
                
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(Color.black)
                        .font(.system(.title2, design: .rounded, weight: .medium))
                        .padding(.trailing, 2)
                    
                    // Label
                    Text("Back to Home")
                        .foregroundStyle(Color.black)
                        .font(.system(.title2, design: .rounded, weight: .medium))
                }
            }
        }
    }
}



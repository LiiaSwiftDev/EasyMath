//
//  Avatar.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-03.
//

import SwiftUI

struct Avatar: View {
    
    var imageName: String
    var color: Color
    var height: CGFloat
    var stroke: Bool
    // Action when avatar is tapped
    var onTap: () -> Void
    
    var body: some View {
        VStack {
            
            Button {
                
                onTap()
                
            } label: {
                ZStack {
                    // Background
                    Circle()
                        .frame(width: 114)
                        .foregroundStyle(color)
                    
                    // Image
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: height)
                        .offset(y: 10)
                    
                    
                }
                .frame(width: 114, height: 114)
                .clipShape(Circle())
                .overlay {
                    
                    // Selection border
                    Circle()
                        .stroke(lineWidth: stroke ? 3 : 0)
                        .foregroundStyle(stroke ? Color(red: 241/255, green: 1/255, blue: 111/255) : .clear)
                        .frame(width: 116)
                    
                }
            }
        }
    }
}

#Preview {
    Avatar(imageName: "boy1", color: Color.yellow, height: 95, stroke: true, onTap: {
        
    })
}

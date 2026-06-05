//
//  Onboarding3.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-01.
//

import SwiftUI

struct Onboarding3: View {
    
    // Avatar images
    var images = ["girl1", "girl4", "boy4", "girl3", "boy2", "boy3", "boy1", "girl2"]
    
    // Background colors for avatars
    var colors = [
        Color(red: 201/255, green: 217/255, blue: 255/255),
        Color(red: 255/255, green: 203/255, blue: 151/255),
        Color(red: 201/255, green: 220/255, blue: 162/255),
        Color(red: 201/255, green: 217/255, blue: 255/255),
        Color(red: 181/255, green: 213/255, blue: 158/255),
        Color(red: 255/255, green: 195/255, blue: 176/255),
        Color(red: 255/255, green: 202/255, blue: 195/255),
        Color(red: 249/255, green: 237/255, blue: 175/255),
    ]
    
    @State var selected: Int?
    
    var body: some View {
        
        ZStack {
            
            // Background color
            Color(red: 251/255, green: 255/255, blue: 255/255)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                
                // Greeting text
                Text("Hi, Robert!")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 10)
                
                // Title
                Text("Choose your Avatar")
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .kerning(3)
                    .foregroundStyle(Color.black)
                
                // Avatar grid
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 32) {
                    ForEach(images.indices, id: \.self) { index in
                        
                        Avatar(imageName: images[index], color: colors[index],
                               height: avatarHeight(index: index), stroke: selected == index, onTap: {
                            
                            // Select avatar
                            selected = index
                        })
                    }
                }
                .padding(.vertical, 44)
                .padding(.horizontal, 20)
                
                // Bottom navigation buttons
                HStack(spacing: 34) {
                    
                    // Skip onboarding
                    Skip()
                    
                    // Finish onboarding and open app
                    Next()
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.horizontal, 20)
        }
    }
    
    func avatarHeight(index: Int) -> CGFloat {
        
        if index == 1 {
            return 88
        } else {
            return 95
        }
        
    }
}

#Preview {
    Onboarding3()
}

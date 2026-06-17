//
//  FireworkBurst(.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-11.
//

import SwiftUI

struct FireworkBurst: View {
    
    // Controls animation start
    @State private var animate = false
    
    var body: some View {
        ZStack {
            
            // Firework particles
            ForEach(0..<12, id: \.self) { index in
                
                Rectangle()
                    .fill(Color(red: 0/255, green: 199/255, blue: 0/255))
                    .frame(width: 3, height: 12)
                // Move outward
                    .offset(y: animate ? -80 : 0)
                // Distribute particles in a circle
                    .rotationEffect(.degrees(Double(index) / Double(12) * 360))
                // Fade and scale animation
                    .opacity(animate ? 0 : 1)
                    .scaleEffect(animate ? 1.2 : 0.5)
                    .animation(
                        .easeOut(duration: 0.6),
                        value: animate
                    )
            }
        }
        .onAppear {
            animate = true
        }
    }
}

#Preview {
    FireworkBurst()
}

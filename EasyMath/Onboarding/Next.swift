//
//  Next.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-04.
//

import SwiftUI

struct Next: View {
    
    var onTap: () -> Void
    
    var body: some View {
        // Next Button
        Button {
            
            onTap()
            
        } label: {
            ZStack {
                Capsule()
                    .frame(width: 94, height: 40)
                    .foregroundStyle(Color(red: 241/255, green: 1/255, blue: 111/255))
                    .overlay {
                        Capsule()
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(red: 206/255, green: 43/255, blue: 105/255))
                    }
                
                Text("Next")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                
            }
        }
        
    }
}

#Preview {
    Next(onTap: {
        // nothing
    })
}

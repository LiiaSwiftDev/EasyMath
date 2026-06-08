//
//  Skip.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-04.
//

import SwiftUI

struct Skip: View {
    
    var onTap: () -> Void
    
    var body: some View {
        // Skip button
        Button {
        
            onTap()
            
        } label: {
            ZStack {
                Capsule()
                    .frame(width: 94, height: 40)
                    .foregroundStyle(Color(red: 251/255, green: 255/255, blue: 255/255))
                    .overlay {
                        Capsule()
                            .stroke(.pink.opacity(0.5), lineWidth: 1)

                    }
                
                Text("Skip")
                    .foregroundStyle(.pink.opacity(0.5))
                    .font(.title3)
                
            }
        }
    }
}

#Preview {
    Skip(onTap: {
        // nothing
    })
}

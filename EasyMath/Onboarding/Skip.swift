//
//  Skip.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-04.
//

import SwiftUI

struct Skip: View {
    var body: some View {
        // Skip button
        Button {
            // TODO
            
        } label: {
            ZStack {
                Capsule()
                    .frame(width: 94, height: 40)
                    .foregroundStyle(Color(red: 251/255, green: 255/255, blue: 255/255))
                    .overlay {
                        Capsule()
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(red: 223/255, green: 149/255, blue: 173/255))
                    }
                
                Text("Skip")
                    .foregroundStyle(Color(red: 223/255, green: 149/255, blue: 173/255))
                    .font(.title3)
                
            }
        }
    }
}

#Preview {
    Skip()
}

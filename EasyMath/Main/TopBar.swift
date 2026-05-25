//
//  TopBar.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-10.
//

import SwiftUI

struct TopBar: View {
    
    // Connection to the navigation path from MainView.
    @Binding var path: [Int]
    
    var body: some View {
        // Top bar with profile and score
        HStack(spacing: 0) {
            Button {
                // Open Profile View
                path.append(3)
            } label: {
                ProfileBadge()
            }
            
            Spacer()
            
            ScoreBadge()
        }
    }
}

#Preview {
    TopBar(path: .constant([3]))
}


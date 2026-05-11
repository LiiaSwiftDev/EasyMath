//
//  TopBar.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-10.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        // Top bar with profile and score
        HStack(spacing: 0) {
            ProfileCard()
            
            Spacer()
            
            ScoreBadge()
        }
    }
}

#Preview {
    TopBar()
}

//
//  ScoreBadgeButton.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-01.
//

import SwiftUI

struct ScoreBadgeButton: View {

    // Connection to the navigation path from MainView.
    @Binding var path: [Int]
    
    var body: some View {
        Button {
            path.append(4)
        } label: {
            ScoreBadge()
        }

    }
}

#Preview {
    ScoreBadgeButton(path: .constant([4]))
}

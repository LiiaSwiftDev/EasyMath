//
//  PageIndicator.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-08-14.
//

import SwiftUI

struct PageIndicator: View {
    
    @Environment(RewardsViewModel.self) private var rewardsModel
    
    var body: some View {
        // Page indicators
        HStack {
            ForEach(0..<6) { index in
                Circle()
                    .fill(index == rewardsModel.currentIndex ? Color(red: 241/255, green: 1/255, blue: 111/255) : Color(red: 227/255, green: 232/255, blue: 232/255))
                    .frame(width: 7, height: 7)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    PageIndicator()
}

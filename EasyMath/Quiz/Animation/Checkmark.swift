//
//  Checkmark.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-11.
//

import SwiftUI

struct Checkmark: View {
    
    var checkmarkItem: CheckmarkItem
    
    var body: some View {
        
        // Checkmark image
        Image(checkmarkItem.imageName)
            .resizable()
            .scaledToFit()
            .frame(height: checkmarkItem.imageHeight)
    }
}

#Preview {
    Checkmark(checkmarkItem: CheckmarkItem(imageName: "checkmark1", imageHeight: 50))
}

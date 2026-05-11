//
//  Buble.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-10.
//

import SwiftUI

struct Buble: View {
    
    var width: CGFloat
    
    var body: some View {
        Image("buble")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width)
    }
}

#Preview {
    Buble(width: 24)
}

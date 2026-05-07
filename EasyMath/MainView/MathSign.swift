//
//  SingView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-04-28.
//

import SwiftUI

struct MathSign: View {
    
    var mathSign: String
    
    var body: some View {
        // math operation icon
        Image(systemName: mathSign)
            .font(Font.system(size: 40, weight: .semibold))
            .foregroundStyle(Color.white)
            .padding(.top, 10)
            .padding(.leading, 7)
    }
}

#Preview {
    MathSign(mathSign: "divide")
}

//
//  ProfileAvatar.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-07-31.
//

import SwiftUI

struct ProfileAvatar: View {
    
    @Environment(MainViewModel.self) private var model
    
    var body: some View {
        // Selected image profile
        VStack {
            ZStack {
                
                // Circle background
                Circle()
                    .foregroundStyle(LinearGradient(colors: [
                        Color(red: 201/255, green: 217/255, blue: 255/255),
                        Color(red: 222/255, green: 232/255, blue: 254/255)],
                                                    startPoint: .bottomLeading,
                                                    endPoint: .topTrailing))
                    .frame(width: 240, height: 240)
                
                // Character image
                Image(model.selectedImage ?? "boy4")
                    .resizable()
                    .scaledToFit()
                    .frame(height: model.selectedImage == "girl4" ? 200 : 210)
                    .offset(y: model.selectedImage == "girl4" ? 30 : 20)
                    .animation(.easeInOut(duration: 0.2), value: model.selectedImage)
                
            }
            .frame(width: 240, height: 240)
            .clipShape(Circle())
            .padding(.top, 10)
        }.frame(maxWidth: .infinity, alignment: .center)
            .scaleEffect(model.isIPad ? 0.7 : 1)
            .offset(y: model.isIPad ? -40 : 0)
    }
}

#Preview {
    ProfileAvatar()
}

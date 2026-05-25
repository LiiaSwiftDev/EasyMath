//
//  ProfileView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-20.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(MainViewModel.self) private var model
    @Environment(\.dismiss) private var dismiss
    
    // Connection to the navigation path from MainView.
    @Binding var path: [Int]
    
    var body: some View {
        
        @Bindable var model = model
        
        ZStack {
            // Background color
            LinearGradient(colors: [
                Color(red: 253/255, green: 249/255, blue: 246/255),
                Color(red: 255/255, green: 243/255, blue: 220/255)],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 10) {
                
                // Top bar
                ZStack {
                    HStack {
                        
                        Text("Edit Profile")
                            .foregroundStyle(Color.black)
                            .font(.system(.title2, design: .rounded, weight: .bold))
                        
                    }.frame(maxWidth: .infinity, alignment: .center)
                    HStack {
                        Button {
                            // back button
                            // path.removeAll()
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.title)
                        }
                        
                        Spacer()
                        
                        Button("Save") {
                            // TODO
                        }
                        .font(.system(.title2, design: .rounded, weight: .bold))
                        
                    }.foregroundStyle(Color(red: 66/255, green: 190/255, blue: 78/255))
                }
                .padding(.top, 10)
                .padding(.bottom, 25)
                
                // Selected image profile
                VStack {
                    ZStack {
                        Circle()
                            .foregroundStyle(LinearGradient(colors: [
                                Color(red: 197/255, green: 238/255, blue: 195/255),
                                Color(red: 235/255, green: 246/255, blue: 212/255)],
                                                            startPoint: .bottomLeading,
                                                            endPoint: .topTrailing))
                            .frame(width: 250, height: 250)
                        
                        Image("test1")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 280)
                            .offset(y: 30)
                        
                    }
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .padding(.top, 10)
                }.frame(maxWidth: .infinity, alignment: .center)
                
                
                Text("Name")
                    .foregroundStyle(Color.black)
                    .font(Font.system(size: 18, weight: .bold, design: .rounded))
                    .padding(.leading, 5)
                    .padding(.top, 25)
                
                TextField("Enter your name", text: $model.name)
                    .font(.title3)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color.white)
                    )
                    .shadow(radius: 0.5)
                
                GeometryReader { proxy in
                    
                    let spacing: CGFloat = 10
                    let count: CGFloat = 4
                    
                    let availableWidth = proxy.size.width - ( 3 * spacing )
                    let itemWidth = ( availableWidth / count )
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            
                            ProfileCard(image: "test1", width: itemWidth)
                            ProfileCard(image: "test1", width: itemWidth)
                            ProfileCard(image: "test1", width: itemWidth)
                            ProfileCard(image: "test1", width: itemWidth)
                            
                        }
                    }.frame(maxWidth: .infinity)
                    
                }.padding(.top, 20)
                
                Spacer()
                
            }.padding(.horizontal, 20)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProfileView(path: .constant([1]))
}


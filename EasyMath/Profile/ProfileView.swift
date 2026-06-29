//
//  ProfileView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-20.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(MainViewModel.self) private var model
    @Environment(\.dismiss) private var dismiss
    
    // Fetch all saved profiles from SwiftData
    @Query private var profiles: [Profile]
    
    // Connection to the navigation path from MainView.
    @Binding var path: [Int]
    
    var body: some View {
        
        @Bindable var model = model
        
        ZStack(alignment: .top) {
            
            // Background color
            Color(red: 251/255, green: 255/255, blue: 255/255)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 10) {
                
                // Top navigation bar
                ZStack {
                    HStack {
                        
                        // Screen title
                        Text("Edit Profile")
                            .foregroundStyle(Color.black)
                            .font(.system(.title2, design: .rounded, weight: .bold))
                        
                    }.frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        // Back button
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.title)
                        }
                        
                        Spacer()
                        
                        // Save profile button
                        Button("Save") {
                            
                            let name = model.name
                                .trimmingCharacters(in: .whitespacesAndNewlines)
                            let finalName = name.isEmpty ? "Name" : name
                            
                            // Update existing profile
                            if let profile = profiles.first {
                                profile.name = finalName
                                    .trimmingCharacters(in: .whitespacesAndNewlines)
                                profile.image = model.selectedImage ?? profile.image
                            }
                            else {
                                // Create new profile
                                let newProfile = Profile()
                                newProfile.name = finalName
                                    .trimmingCharacters(in: .whitespacesAndNewlines)
                                newProfile.image = model.selectedImage ?? "test1"
                                context.insert(newProfile)
                            }
                            
                            do {
                                try context.save()
                            } catch {
                                print("Save error:", error)
                            }
                            
                            dismiss()
                        }
                        .font(.system(.title2, design: .rounded, weight: .bold))
                        
                    }
                    .foregroundStyle(Color(red: 241/255, green: 1/255, blue: 111/255))
                    .padding(.horizontal, 5)
                }
                .padding(.top, 10)
                .padding(.bottom, 25)
                
                ScrollView(showsIndicators: false) {
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
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        // Name section title
                        Text("Name")
                            .foregroundStyle(Color.black)
                            .font(Font.system(size: 18, weight: .bold, design: .rounded))
                            .padding(.leading, 10)
                        
                        // Name input field
                        TextFieldName()
                        
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 15)
                    
                    GeometryReader { proxy in
                        
                        let spacing: CGFloat = 15
                        let count: CGFloat = 4
                        let pad: CGFloat = 5
                        
                        let availableWidth = proxy.size.width - ( 3 * spacing ) - ( 2 * pad )
                        let itemWidth = ( availableWidth / count )
                        
                        VStack(spacing: 20) {
                            
                            HStack(spacing: 15) {
                                
                                // Profile avatar cards
                                ForEach(0..<4, id: \.self) { index in
                                    ProfileCard(
                                        image: model.images1Row[index],
                                        width: itemWidth,
                                        background: model.color1Row[index],
                                        selected: model.selectedImage == model.images1Row[index],
                                        onTap: {
                                            
                                            model.selectedImage = model.images1Row[index]
                                            
                                        })
                                }
                            }
                            
                            HStack(spacing: 15) {
                                
                                // Profile avatar cards
                                // model.images2Row
                                ForEach(0..<4, id: \.self) { index in
                                    ProfileCard(
                                        image: model.images2Row[index],
                                        width: itemWidth, background: model.color2Row[index],
                                        selected: model.selectedImage == model.images2Row[index],
                                        onTap: {
                                            
                                            model.selectedImage = model.images2Row[index]
                                            
                                        })
                                }
                            }
                        }.padding(.horizontal, 5)
                            .frame(maxWidth: .infinity)
                        // Haptic feedback
                            .sensoryFeedback(.impact(weight: .light, intensity: 0.8), trigger: model.selectedImage)
                        
                    }.padding(.top, 20)
                    
                    Spacer()
                    
                }
            }
            .padding(.horizontal, 15)
        }
        .onAppear(perform: {
            
            if let profile = profiles.first {
                if profiles.first!.name != "Name" {
                    model.name = profile.name
                } else {
                    model.name = ""
                }
                
                model.selectedImage = profile.image
            }
        })
        .navigationBarBackButtonHidden(true)
        .contentShape(Rectangle())
        .onTapGesture {
            model.outsideTap = true
        }
    }
}

#Preview {
    ProfileView(path: .constant([1]))
}


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
    @FocusState private var isFocused: Bool
 
    var body: some View {
        
        @Bindable var model = model
        
        ZStack {
            // Background gradient
            LinearGradient(colors: [
                Color(red: 253/255, green: 249/255, blue: 246/255),
                Color(red: 255/255, green: 243/255, blue: 220/255)],
                           startPoint: .top,
                           endPoint: .bottom)
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
                            
                            // Update existing profile
                            if let profile = profiles.first {
                                // временный тут, позже убрать в onboarding
                                profile.name = model.name
                                    .trimmingCharacters(in: .whitespacesAndNewlines)
                                profile.image = model.selectedImage ?? profile.image
                            }
                            else {
                                // Create new profile
                                let newProfile = Profile()
                                newProfile.name = model.name
                                    .trimmingCharacters(in: .whitespacesAndNewlines)
                                newProfile.image = model.selectedImage ?? "test1"
                                context.insert(newProfile)
                            }
                            
                            try? context.save()
                            
                            dismiss()
                        }
                        .font(.system(.title2, design: .rounded, weight: .bold))
                        
                    }.foregroundStyle(Color(red: 66/255, green: 190/255, blue: 78/255))
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
                                    Color(red: 197/255, green: 238/255, blue: 195/255),
                                    Color(red: 235/255, green: 246/255, blue: 212/255)],
                                                                startPoint: .bottomLeading,
                                                                endPoint: .topTrailing))
                                .frame(width: 250, height: 250)
                            
                            // Character image
                            Image(model.selectedImage ?? "boy4")
                                .resizable()
                                .scaledToFit()
                                .frame(height: model.selectedImage == "girl4" ? 210 : 220)
                                .offset(y: model.selectedImage == "girl4" ? 30 : 20)
                                .animation(.easeInOut(duration: 0.2), value: model.selectedImage)
                            
                        }
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .padding(.top, 10)
                    }.frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        // Name section title
                        Text("Name")
                            .foregroundStyle(Color.black)
                            .font(Font.system(size: 18, weight: .bold, design: .rounded))
                            .padding(.leading, 12)
                        
                        Spacer()
                        
                        if isFocused {
                            Text("\(model.name.count)/6")
                                .foregroundStyle(Color.gray)
                                .font(Font.system(size: 18, weight: .bold, design: .rounded))
                                .animation(.easeInOut(duration: 0.2), value: isFocused)
                                .padding(.trailing, 12)
                        }
                        
                    }.padding(.top, 25)
                    
                    // Name input field
                    TextField("Enter your name", text: $model.name)
                        .font(.system(.title3, design: .rounded))
                        .padding()
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(Color.white)
                                
                                if model.name.count == 6 && isFocused == true {
                                    HStack {
                                        Spacer()
                                        
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundStyle(Color(red: 128/255, green: 220/255, blue: 129/255))
                                            .font(.title)
                                            .animation(.easeInOut(duration: 0.2), value: isFocused)
                                            .padding(.trailing, 10)
                                    }
                                }
                            }
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(isFocused ? Color(red: 128/255, green: 220/255, blue: 129/255) : .gray.opacity(0.2), lineWidth: 2)
                        )
                        .focused($isFocused)
                        .animation(.easeInOut(duration: 0.2), value: isFocused)
                        .onChange(of: model.name) { oldValue, newValue in
                            model.name = TextHelper.limitChars(input: model.name, limit: 6)
                        }
                        .padding(.horizontal, 2)
                    
                    GeometryReader { proxy in
                        
                        let spacing: CGFloat = 10
                        let count: CGFloat = 4
                        
                        let availableWidth = proxy.size.width - ( 3 * spacing )
                        let itemWidth = ( availableWidth / count )
                        
                        VStack(spacing: 20) {
                            
                            HStack(spacing: 10) {
                                
                                // Profile avatar cards
                                ForEach(model.images1Row, id: \.self) { image in
                                    ProfileCard(image: image, width: itemWidth, selected: model.selectedImage == image, onTap: {
                                        
                                        model.selectedImage = image
                                        
                                    })
                                }
                                
                            }
                            
                            HStack(spacing: 10) {
                                
                                // Profile avatar cards
                                ForEach(model.images2Row, id: \.self) { image in
                                    ProfileCard(image: image, width: itemWidth, selected: model.selectedImage == image, onTap: {
                                        
                                        model.selectedImage = image
                                        
                                    })
                                }
                                
                            }
                        }.frame(maxWidth: .infinity)
                        
                    }.padding(.top, 20)
                    
                    Spacer()
                    
                }
                
            }.padding(.horizontal, 20)
            
        }
        .onAppear(perform: {
            if let profile = profiles.first {
                model.name = profile.name
                model.selectedImage = profile.image
            }
        })
        .navigationBarBackButtonHidden(true)
        .contentShape(Rectangle())
        .onTapGesture {
            isFocused = false
        }
    }
}

#Preview {
    ProfileView(path: .constant([1]))
}


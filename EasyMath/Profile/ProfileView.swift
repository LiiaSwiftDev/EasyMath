//
//  ProfileView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-20.
//

import SwiftUI
import SwiftData
import AVFoundation

struct ProfileView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(MainViewModel.self) private var model
    @Environment(RewardsViewModel.self) private var rewardsModel
    @Environment(\.dismiss) private var dismiss
    
    // Fetch all saved profiles from SwiftData
    @Query private var profiles: [Profile]
    @Query var soldItems: [OwnedItem]
    @Query var avatarItems: [ItemsOnAvatar]
    
    @State private var audioPlayer: AVAudioPlayer?
    
    // Connection to the navigation path from MainView.
    @Binding var path: [Int]
    
    @State var showItemOnAvatar = [String]()
    
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
                            // Check if the user was previously on the Result View and navigate back to it
                            if path.contains(2) {
                                path.append(2)
                            }
                            else {
                                path.removeAll()
                            }
                            
                            rewardsModel.selectedItem = nil
                            rewardsModel.returnFromRewards = false
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.title)
                        }
                        
                        Spacer()
                        
                        // Save profile button
                        Button("Save") {
                            
                            // Save the selected item for the current avatar
                            if let item = rewardsModel.selectedItem, let profile = profiles.first {
                                
                                // Remove previously saved avatar items
                                for itemStorage in avatarItems {
                                    context.delete(itemStorage)
                                }
                                
                                // Create a new item storage
                                let newItemStorage = ItemsOnAvatar()
                                newItemStorage.item = item
                                newItemStorage.nameAvatar = model.selectedImage ?? profile.image
                                context.insert(newItemStorage)
                                
                                try? context.save()
                            } else {
                                // No item selected — remove the previously saved item
                                for itemStorage in avatarItems {
                                    context.delete(itemStorage)
                                }
                            }

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
                            
                            // Check if the user was previously on the Result View and navigate back to it
                            if path.contains(2) {
                                path.append(2)
                            } else {
                                path.removeAll()
                            }
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
                    ProfileAvatar()
                    
                    Group {
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
                        
                        // Reddem Reward
                        RedeemRewardsBanner(path: $path)
                        
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
                                                rewardsModel.selectedItem = nil
                                                model.selectedImage = model.images1Row[index]
                                                playSoundClick()
                                                
                                            })
                                    }
                                }
                                
                                HStack(spacing: 15) {
                                    
                                    // Profile avatar cards
                                    ForEach(0..<4, id: \.self) { index in
                                        ProfileCard(
                                            image: model.images2Row[index],
                                            width: itemWidth, background: model.color2Row[index],
                                            selected: model.selectedImage == model.images2Row[index],
                                            onTap: {
                                                rewardsModel.selectedItem = nil
                                                model.selectedImage = model.images2Row[index]
                                                playSoundClick()
                                                
                                            })
                                    }
                                }
                            }.padding(.horizontal, 5)
                                .frame(maxWidth: .infinity)
                            // Haptic feedback
                                .sensoryFeedback(.impact(weight: .light, intensity: 0.8), trigger: model.selectedImage)
                            
                        }.padding(.top, 20)
                    }
                    .offset(y: model.isIPad ? -100 : 0)
                    
                    Spacer()
                    
                }
            }
            .padding(.horizontal, 15)
        }
        .onAppear(perform: {

            if rewardsModel.selectedItem == nil {
                // Get selected item
                if let item = avatarItems.first {
                    rewardsModel.selectedItem = item.item
                }
            }
            
            // Restore profile image
            if rewardsModel.returnFromRewards != true {
                if let profile = profiles.first {
                    model.selectedImage = profile.image
                }
            }
            
            // Check if user selected item
            if rewardsModel.selectedItem != nil {
                let item = rewardsModel.selectedItem
                
                // Check if item was purchased
                let sold = soldItems.contains { soldItem in
                    soldItem.soldItem == item
                }
                
                // Reset item if it is not owned
                if !sold {
                    rewardsModel.selectedItem = nil
                }

            }
    
            // Restore profile name
            if let profile = profiles.first {
                if profiles.first!.name != "Name" {
                    model.name = profile.name
                } else {
                    model.name = ""
                }
            }
        })
        .navigationBarBackButtonHidden(true)
        .contentShape(Rectangle())
        .onTapGesture {
            model.outsideTap = true
        }
    }
    
    // Play click sound
    func playSoundClick() {
        
        guard let url = Bundle.main.url(forResource: "universfield-bubble-pop-04-323580", withExtension: "mp3") else {
            return
        }
        
        audioPlayer = try! AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
        
    }
    
}

#Preview {
    ProfileView(path: .constant([1]))
}


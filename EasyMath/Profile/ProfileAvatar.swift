//
//  ProfileAvatar.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-07-31.
//

import SwiftUI
import SwiftData

struct ProfileAvatar: View {
    
    @Environment(MainViewModel.self) private var model
    @Environment(RewardsViewModel.self) private var rewardsModel
    @Environment(\.modelContext) private var context
    
    // Fetch all saved profiles from SwiftData
    @Query private var profiles: [Profile]
    @Query var avatarItems: [ItemsOnAvatar]
    
    // Settings for the selected avatar item
    var selectedItemSettings: ItemSettings? {
        guard let avatar = model.selectedImage,
              let item = rewardsModel.selectedItem else {
            return nil
        }
        
        return rewardsModel.itemSettings.first {
            $0.avatar == avatar && $0.item == item
        }
    }
    
    @State var tapOnItem = false
    
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
                    .frame(width: 260, height: 260)
                
                // Character image
                Image(model.selectedImage ?? "boy4")
                    .resizable()
                    .scaledToFit()
                    .frame(height: model.selectedImage == "girl4" ? 200 : 210)
                    .offset(y: model.selectedImage == "girl4" ? 40 : 30)
                    .animation(.easeInOut(duration: 0.2), value: model.selectedImage)
                
                // Display the selected reward item on the avatar
                if let selected = rewardsModel.selectedItem,
                   let setting = selectedItemSettings {
                    Image(selected)
                        .resizable()
                        .scaledToFit()
                        .frame(width: setting.widthItem)
                        .offset(setting.offsetItem)
                        .onTapGesture {
                            removeItem()
                        }
                }
                
            }
            .frame(width: 260, height: 260)
            .clipShape(Circle())
            .padding(.top, 10)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .scaleEffect(model.isIPad ? 0.7 : 1)
        .offset(y: model.isIPad ? -40 : 0)
    }
    
    func removeItem() {
        rewardsModel.selectedItem = nil
        rewardsModel.amountOfStars = nil
        
        // Remove previously saved avatar items
        for itemStorage in avatarItems {
            context.delete(itemStorage)
        }
    }
}

#Preview {
    ProfileAvatar()
}

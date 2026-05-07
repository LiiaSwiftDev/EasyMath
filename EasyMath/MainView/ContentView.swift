//
//  ContentView.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-04-22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(MainViewModel.self) var model
    
    var body: some View {
        ZStack {
            
            // Background color
            Color(red: 255/255, green: 243/255, blue: 220/255)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // Top bar with profile and score
                HStack(spacing: 0) {
                    ProfileCard()
                    
                    Spacer()
                    
                    ScoreBadge()
                }
                
                // Title
                Text("Pick a category!")
                    .font(Font.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundStyle(Color(red: 80/255, green: 48/255, blue: 0/255))
                    .padding(.bottom, 30)
                    .padding(.top, 15)
                
                // 4 quiz cards buttons
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(spacing: 20), GridItem(spacing: 20)], spacing: 20) {
                        ForEach(model.cards) { card in
                            Button {
                                // TODO
                            } label: {
                                QuizCard(card: card)
                            }
                        }.padding(.trailing, 14)
                        
                    }
                    
                }
            }
            .padding(.horizontal, 20)
            .background {
                // Decorative elements at the bottom of the screen
                Ellipse()
                    .frame(width: 610, height: 390)
                    .foregroundColor(Color(red: 243/255, green: 164/255, blue: 133/255))
                    .offset(y: 370)
                
                Image("lion-smile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 280)
                    .rotationEffect(.degrees(20))
                    .offset(x: -120, y: 380)
                
                ZStack {
                    Image("chat-bubble")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 120)
                        .offset(x: 70, y: 290)
                    
                    Text(model.displayedText)
                        .font(Font.system(size: 16, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .offset(x: 70, y: 284)
                }
            }
        }
        .onAppear {
            // Start typing animation
            model.typingAnimationLoop()
        }
        .onDisappear {
            // Stop animation when view disappears
            model.animationTask?.cancel()
            model.animationTask = nil
        }
        
    }
    
}

#Preview {
    ContentView()
}

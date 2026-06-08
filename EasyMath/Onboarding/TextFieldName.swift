//
//  TextFieldName.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-07.
//

import SwiftUI

struct TextFieldName: View {

    @Environment(OnboardingModel.self) var onboardingModel
    
    // Focus state for TextField (active/inactive)
    @FocusState var textfieldFocused: Bool

    // Cursor position (max 5 because limit is 6 chars)
    var cursorIndex: Int {
        min(onboardingModel.name.count, 5)
    }
    
    var body: some View {
        
        @Bindable var onboardingModel = onboardingModel
        
        ZStack {
            
            // Invisible TextField
            TextField("", text: $onboardingModel.name)
                .focused($textfieldFocused)
                .foregroundColor(.clear)
                .accentColor(.clear)
                .keyboardType(.asciiCapable)
                .textContentType(.oneTimeCode)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .onChange(of: onboardingModel.name) { oldValue, newValue in
                    
                    // Limit input length
                    onboardingModel.name = onboardingModel.limitChar(input: onboardingModel.name, limit: 6)
                    
                    // Update cursor position state
                    onboardingModel.updateIsCursorAtEnd()
                }
                .onChange(of: onboardingModel.outsideTap) {
                    onboardingModel.outsideTap = false
                    textfieldFocused = false
                }
            
            // Letter with underline below
            HStack(spacing: 12) {
                ForEach(0..<6, id: \.self) { index in
                    VStack(spacing: 4) {
                        ZStack {
                            
                            Text(onboardingModel.character(at: index))
                                .font(.title2)
                                .frame(width: 24, height: 28, alignment: .bottom)
                            
                            // Custom blinking cursor
                            if textfieldFocused &&
                                index == cursorIndex &&
                                onboardingModel.showCursor {
                                
                                Rectangle()
                                    .frame(width: 2, height: 24)
                                    .offset(x: onboardingModel.isCursorAtEnd ? 7 : -7, y: 0)
                            }
                            
                        }
                        .frame(width: 24, height: 28, alignment: .bottom)
                        
                        // Underline for each character slot
                        Rectangle()
                            .frame(width: 20, height: 1)
                            .foregroundStyle(Color.pink.opacity(0.5))
                    }
                }
            }
            .allowsHitTesting(false)
        }
        .frame(height: 60)
        .overlay {
            
            // Border around custom TextField
            RoundedRectangle(cornerRadius: 16)
                .stroke(.pink.opacity(0.5))
                .frame(width: 274, height: 64)
            
        }
        .onAppear {
            onboardingModel.animatoinСursor()
        }
        .onDisappear {
            onboardingModel.animationTask?.cancel()
        }
    }
}

#Preview {
    TextFieldName()
}

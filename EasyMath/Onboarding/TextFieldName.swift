//
//  TextFieldName.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-06-07.
//

import SwiftUI

struct TextFieldName: View {
    
    @Environment(MainViewModel.self) private var model
    
    // Focus state for TextField (active/inactive)
    @FocusState var textfieldFocused: Bool
    
    // Cursor position (max 5 because limit is 6 chars)
    var cursorIndex: Int {
        min(model.name.count, 5)
    }
    
    var body: some View {
        
        @Bindable var model = model
        
        ZStack {
            
            // Invisible TextField
            TextField("", text: $model.name)
                .focused($textfieldFocused)
                .foregroundColor(.clear)
                .accentColor(.clear)
                .keyboardType(.asciiCapable)
                .textContentType(.oneTimeCode)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .onChange(of: model.name) { oldValue, newValue in
                    
                    // Limit input length
                    model.name = model.limitChar(input: model.name, limit: 6)
                    
                    // Update cursor position state
                    model.updateIsCursorAtEnd()
                }
                .onChange(of: model.outsideTap) {
                    model.outsideTap = false
                    textfieldFocused = false
                }
            
            // Letter with underline below
            HStack(spacing: 12) {
                ForEach(0..<6, id: \.self) { index in
                    VStack(spacing: 4) {
                        ZStack {
                            
                            Text(model.character(at: index))
                                .font(.title2)
                                .frame(width: 24, height: 28, alignment: .bottom)
                            
                            // Custom blinking cursor
                            if textfieldFocused &&
                                index == cursorIndex &&
                                model.showCursor {
                                
                                Rectangle()
                                    .frame(width: 2, height: 24)
                                    .offset(x: model.isCursorAtEnd ? 7 : -7, y: 0)
                            }
                            
                        }
                        .frame(width: 24, height: 28, alignment: .bottom)
                        
                        // Underline for each character slot
                        Rectangle()
                            .frame(width: 20, height: 1)
                            .foregroundStyle(.pink.opacity(0.5))
                    }
                }
            }
            .allowsHitTesting(false)
        }
        .frame(width: 274, height: 64)
        .overlay {
            
            // Border around custom TextField
            RoundedRectangle(cornerRadius: 16)
                .stroke(.pink.opacity(0.5), lineWidth: 1)
                .frame(width: 274, height: 64)
            
        }
        .onAppear {
            model.animationСursor()
        }
        .onDisappear {
            model.animationCursorTask?.cancel()
        }
    }
}

#Preview {
    TextFieldName()
}

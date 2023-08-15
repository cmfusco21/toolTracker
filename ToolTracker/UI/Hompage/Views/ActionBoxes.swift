//
//  ActionBoxes.swift
//  ToolTracker
//
//  Created by Christopher Fusco on 8/4/23.
//

import SwiftUI

struct ActionBoxes: View {
    
    var title: String
    var image: String
    var isSelected: Bool
    let action: (() -> Void)
    var body: some View {
        Button(action: action) {
            VStack() {
                HStack() {
                    Text(title)
                        .font(.title2)
                        .bold()
                      
                    Image(systemName: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .foregroundColor(Color.yellow)
                .opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: 28)
            }
            .padding(8)
        }
    .background(Color.black)
    .opacity(isSelected ? 1.0 : 0.8)
    .buttonStyle(.bordered)
    .border(.bar)

    }
}


//
//  HomepageHeader.swift
//  ToolTracker
//
//  Created by Christopher Fusco on 8/4/23.
//


import SwiftUI
struct HomepageHeader: View {
    
    var toolsOwned: Int
    var wishLIst: Int
    
    var body: some View {
        ZStack {
           
                HStack {
                    VStack() {
                        Image(systemName: "hammer.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 144, maxHeight: 144)
                            .foregroundColor(Color.yellow)
                            .opacity(0.5)
                            .padding(8)
                        
                        
                    }
                    
                    VStack(alignment: .center) {
                        Text("Tool Tracker")
                            .font(.largeTitle)
                            .padding(.bottom, 16)
                            .foregroundColor(Color.yellow)
                            .opacity(0.5)
                            .lineLimit(2)
                        HStack(alignment: .top) {
                            VStack(alignment: .center) {
                                Text("Tools Owned")
                                    .font(.headline)
                                    .lineLimit(1)
                                Text(String(toolsOwned))
                                    .font(.largeTitle)
                            }
                            .foregroundColor(Color.yellow)
                            .opacity(0.5)
                            
                            Spacer()
                            
                            VStack(alignment: .center) {
                                Text("Wishlist")
                                    .font(.headline)
                                    .lineLimit(1)
                                Text(String(wishLIst))
                                    .font(.largeTitle)
                            }
                            .foregroundColor(Color.yellow)
                            .opacity(0.5)
                        }
                        .padding(16)
                    }
                    
                }
            }
        
        .background(Color.black)
        .cornerRadius(16)
    }
    
}

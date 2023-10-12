//
//  DescriptionView.swift
//  ToolTracker
//
//  Created by Christopher Fusco on 8/4/23.
//

import SwiftUI

struct DescriptionView: View {
    @State var toolBrand: String
    @State var toolType: String
    @State var currentlyOwned: Bool
    @State var purashedDate = Date()
    
        var body: some View {
            
                VStack {
                    Text(toolBrand)
                    Text(toolType)
                    if currentlyOwned {
                        Text(String(purashedDate.formatted(date: .abbreviated, time: .omitted)))
                    }
                }
                .navigationTitle("Tool Description")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button("Edit", action: {}))
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(toolBrand: "", toolType: "", currentlyOwned: true)
    }
}

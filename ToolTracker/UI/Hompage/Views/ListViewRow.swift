//
//  ListViewRow.swift
//  ToolTracker
//
//  Created by Christopher Fusco on 8/4/23.
//

import SwiftUI

struct ListViewRow: View {
    @State var brand: String
    @State var type: String
    @State var date: Date
    @State var onwnedItem: Bool
    
    var body: some View {
        
        NavigationLink(
            destination: DescriptionView(toolBrand: brand, toolType: type, currentlyOwned: onwnedItem, purashedDate: date),
            label: {
                
                
                HStack {
                    Image(systemName: "hammer")
                        .bold()
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Text("Brand:")
                                .bold()
                            Text(brand)
                        }
                        HStack {
                            Text("Type:")
                                .bold()
                            Text(type)
                        }
                        if onwnedItem {
                            HStack {
                                Text("Date Purchased:")
                                    .bold()
                                    .lineLimit(1)
                                Text(String("\(date.formatted(date: .abbreviated, time: .omitted))"))
                            }
                            .font(.subheadline)
                        }
                        
                    }
                }
            })
    }
    
}

struct ListViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ListViewRow(brand: "", type: "", date: Date.now, onwnedItem: true)
    }
}

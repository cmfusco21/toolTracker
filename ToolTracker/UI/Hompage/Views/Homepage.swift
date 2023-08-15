//
//  Homepage.swift
//  ToolTracker
//
//  Created by Christopher Fusco on 8/4/23.
//

import SwiftUI



struct Homepage: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.datePurchases, ascending: true)],
        animation: .default)
     var items: FetchedResults<Item>
    
    @StateObject var viewModel: HomepageViewModel
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationView {
            VStack() {
                HomepageHeader(toolsOwned: items.filter({ $0.isOwned}).count, wishLIst: items.filter({ !$0.isOwned}).count)
                if UIDevice.isIPad {
                    VStack() {
                        ActionBoxes(title: "Owned", image: "eye.circle.fill", isSelected: viewModel.isOwned, action: {viewModel.listSelected(isOwned: true)})
                            .cornerRadius(16)
                        ActionBoxes(title: "Wishlist", image: "bag.circle.fill", isSelected: !viewModel.isOwned, action: {viewModel.listSelected(isOwned: false)})
                            .cornerRadius(16)
                    }
                } else {
                    HStack(alignment: .center) {
                        
                        ActionBoxes(title: "Owned", image: "eye.circle.fill", isSelected: viewModel.isOwned, action: {viewModel.listSelected(isOwned: true)})
                            .cornerRadius(16)
                        ActionBoxes(title: "Wishlist", image: "bag.circle.fill", isSelected: !viewModel.isOwned, action: {viewModel.listSelected(isOwned: false)})
                            .cornerRadius(16)
                    }
                }
                Divider()
                    ListView(ownedTools: viewModel.isOwned )
                Spacer()
                
                ActionBoxes(title: "Add", image: "plus.circle.fill", isSelected: true, action: {
                    showAddSheet = true
                })
                    .cornerRadius(16)
                
            }
            .padding(8)
            .sheet(isPresented: $showAddSheet) {
                NewItemView()
            }
        }
        
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage(viewModel: HomepageViewModel())
    }
}

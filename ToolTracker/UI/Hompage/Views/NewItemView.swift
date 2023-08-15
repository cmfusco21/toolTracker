//
//  NewItem.swift
//  ToolTracker
//
//  Created by Christopher Fusco on 8/4/23.
//

import SwiftUI

struct NewItemView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.datePurchases, ascending: true)],
        animation: .default)
    var items: FetchedResults<Item>
    
    
    let viewModel = NewItemViewModel()
    
    @State private var toolBrand: String = "Craftsman"
    @State private var toolType: String = "Hammer"
    @State private var currentlyOwned: Bool = true
    @State private var purashedDate = Date()
    
    let brandType = ["Craftsman", "Black & Decker", "Makita", "Milwaukee Tool", "Dewalt", "Other"]
    let typesOfTools = ["Hammer", "Chainsaw", "Screwdriver", "Powerwasher", "Other"]
    
    var body: some View {
        Form {
            Section {
                VStack() {
                    Toggle("Purchased", isOn: $currentlyOwned)
                    Divider()
                    Picker("Brand",
                           selection: $toolBrand) {
                        ForEach(brandType, id: \.self) {
                            Text($0)
                        }
                        .pickerStyle(.menu)
                    }
                    Divider()
                    Picker("Type of Tool",
                           selection: $toolType) {
                        ForEach(typesOfTools, id: \.self) {
                            Text($0)
                        }
                        .pickerStyle(.menu)
                    }
                    Divider()
                    if currentlyOwned {
                        DatePicker("Date Purchased", selection: $purashedDate, displayedComponents: [.date])
                }
                    Spacer()
                }
                Button {
                    save(brand: toolBrand,
                         toolType: toolType,
                         datePurached: purashedDate,
                         isOwned: currentlyOwned)
                } label: {
                    Text("Save")
                }
            }
        }
        
    }
    private func save(brand: String, toolType: String, datePurached: Date, isOwned: Bool) -> Void {
        
        let newItem = Item(context: viewContext)
        newItem.id = UUID()
        newItem.brand = brand
        newItem.descript = toolType
        newItem.isOwned = isOwned
        newItem.datePurchases = datePurached
        
        do {
            try viewContext.save()
            self.dismiss()
            
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            
        }
    }
}

struct NewItem_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
    }
}

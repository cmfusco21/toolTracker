//
//  NewItemView.swift
//  ToolTracker
//
//  Created by Christopher Fusco on 8/4/23.
//

import Foundation
import SwiftUI

class NewItemViewModel: ObservableObject {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.brand, ascending: true)],
        animation: .default)
     var items: FetchedResults<Item>
    
    init() {}
    
    
    func save(brand: String, toolType: String, datePurached: Date, isOwned: Bool) -> Void {
      
            let newItem = Item(context: viewContext)
            newItem.id = UUID()
            newItem.brand = brand
            newItem.descript = toolType
            newItem.isOwned = isOwned
            newItem.datePurchases = datePurached

            do {
                try viewContext.save()
                
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            
        }
    }
    
     func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

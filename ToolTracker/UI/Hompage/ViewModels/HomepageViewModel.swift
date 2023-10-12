//
//  HomepageViewModel.swift
//  ToolTracker
//
//  Created by Christopher Fusco on 8/4/23.
//

import Foundation
import SwiftUI

enum SortbuyEnum: Int, Codable, CaseIterable {
    case type = 1, brand, year
    
    func description() -> String {
        switch self {
            
        case .type:
            return "Type"
        case .brand:
            return "Brand"
        case .year:
            return "Year"
        }
    }
}

class HomepageViewModel: ObservableObject {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.datePurchases, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @Published var isOwned: Bool = true
    
    init() {
        performNetworkCall()
    }
    
    func listSelected(isOwned: Bool) {
        self.isOwned = isOwned
    }
    private func deleteItems(offsets: IndexSet) {
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


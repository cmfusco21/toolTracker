//
//  ListView.swift
//  ToolTracker
//
//  Created by Christopher Fusco on 8/4/23.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.datePurchases, ascending: true)],
        animation: .default)
    var items: FetchedResults<Item>
    var viewModel = NewItemViewModel()
    @State var realData: String = ""
    var ownedTools: Bool
    
    var body: some View {
        HStack {
            Menu {
                ForEach(SortbuyEnum.allCases, id: \.self) { data in
                    Button(data.description(), action: {
                        self.realData = data.description()
                    })
                }
            } label: {
                VStack(alignment: .leading) {
                    HStack() {
                        Text("Sort By: \(realData) ")
                            .font(.title2)
                            .bold()
                    }
                }
                .foregroundColor(Color.yellow)
                .opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(Color.black)
                .cornerRadius(16)
            }
            
            Spacer()
            Menu {
                Button("Assend", action: {})
                Button("Desend", action: {})
                
            } label: {
                
                VStack() {
                    HStack() {
                        Image(systemName: "arrow.up.arrow.down.square.fill")
                    }
                }
                .foregroundColor(Color.yellow)
                .opacity(0.5)
                .frame(maxWidth: 48, maxHeight: 48)
                .background(Color.black)
                .cornerRadius(16)
            }
        }
        
        List {
            
                ForEach(items.filter({ $0.isOwned == ownedTools })) { data in
                    ListViewRow(brand: data.brand ?? "Fake", type: data.descript ?? "Fake", date: data.datePurchases ?? Date.now, onwnedItem: ownedTools)
                }
                .onDelete(perform: deleteItems)
            }
        .listItemTint(.black)
        .listRowSeparator(.visible)
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


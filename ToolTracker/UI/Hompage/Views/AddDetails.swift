//
//  AddDetails.swift
//  ToolTracker
//
//  Created by Christopher Fusco on 8/14/23.
//

import SwiftUI

struct AddDetails: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Brands.toolBrand, ascending: true)],
        animation: .default)
    var brand: FetchedResults<Brands>
    
    var isBrandBool: Bool = true
    @State private var toolBrand: String = ""
    @StateObject private var viewModel = NewItemViewModel()
    
    var body: some View {

        VStack(spacing: 16) {
            HStack(spacing: 16) {
                Text("New Brand", tableName: "New Type of Tool")
                TextField("Name of new brand",
                          text: $toolBrand)
            }
            .font(.headline)
            
                Spacer()
            }
            .padding(.top, 48)
            .padding(.horizontal, 16)
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()
            })
            .navigationBarItems(trailing: Button("Save") {
                save(brand: toolBrand)
            })
            
    }
     
    
    private func save(brand: String) -> Void {
        
        let newItem = Brands(context: viewContext)
       
        newItem.brandID = UUID()
        newItem.toolBrand = brand
        
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

struct AddDetails_Previews: PreviewProvider {
    static var previews: some View {
        AddDetails()
    }
}

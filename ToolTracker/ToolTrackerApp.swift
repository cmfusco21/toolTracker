//
//  ToolTrackerApp.swift
//  ToolTracker
//
//  Created by Christopher Fusco on 8/4/23.
//

import SwiftUI

@main
struct ToolTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Homepage(viewModel: HomepageViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
               
        }
        
    }
}

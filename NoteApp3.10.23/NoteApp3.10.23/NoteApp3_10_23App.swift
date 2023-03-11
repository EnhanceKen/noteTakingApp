//
//  NoteApp3_10_23App.swift
//  NoteApp3.10.23
//
//  Created by Consultant on 3/10/23.
//

import SwiftUI

@main
struct NoteApp3_10_23App: App {
    let persistenceController = PersistenceController.shared

    
    var body: some Scene {
        WindowGroup {
            
            
            
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dateHolder)
        }
    }
}

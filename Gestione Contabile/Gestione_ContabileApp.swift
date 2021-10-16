//
//  Gestione_ContabileApp.swift
//  Gestione Contabile
//
//  Created by Angelo Sannino on 16/10/21.
//

import SwiftUI

@main
struct Gestione_ContabileApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

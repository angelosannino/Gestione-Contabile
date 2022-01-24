import SwiftUI

@main
struct Gestione_ContabileApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CategoryView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

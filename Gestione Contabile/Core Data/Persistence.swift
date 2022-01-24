import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Gestione_Contabile")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                debugPrint(error.localizedDescription)
            }
        })
    }
}

extension PersistenceController {
    var context: NSManagedObjectContext {
        container.viewContext
    }

    func fetch<T>(_ request: NSFetchRequest<T>) throws -> [T] where T : NSFetchRequestResult {
        try container.viewContext.fetch(request)
    }

    func delete(_ object: NSManagedObject) {
        container.viewContext.delete(object)
    }

    func save() {
        do {
            try container.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

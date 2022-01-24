import CoreData

@objc extension NSFetchRequest {
    func byId(_ id: String) -> NSFetchRequest {
        predicate = NSPredicate(format: "id == %@", id)
        return self
    }
}

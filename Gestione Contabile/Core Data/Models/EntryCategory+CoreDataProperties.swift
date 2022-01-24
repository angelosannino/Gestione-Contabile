import Foundation
import CoreData


extension EntryCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntryCategory> {
        return NSFetchRequest<EntryCategory>(entityName: "EntryCategory")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?

    var getId: String {
        id.notNil
    }
    
}

extension EntryCategory {
    func exists() -> Bool {
        do {
            return try !PersistenceController.shared.fetch(EntryCategory.fetchRequest().byId(getId)).isEmpty
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }
    }
}

extension EntryCategory {
    static func mock(name: String = "Sample Category",
                     entryType: EntryType = .expense,
                     categoryType: CategoryType = .concrete) -> EntryCategory {
        let category = EntryCategory()
        category.id = UUID().uuidString
        category.entryType = entryType
        category.categoryType = categoryType
        return category
    }
}

extension EntryCategory : Identifiable {
    
}

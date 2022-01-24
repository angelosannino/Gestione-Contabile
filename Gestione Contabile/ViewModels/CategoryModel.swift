import Foundation
import CoreData

class CategoryModel: ObservableObject {
    @Published var list: [EntryCategory] = []

    func new(name: String, entryType: EntryType, categoryType: CategoryType) {
        let category = EntryCategory(context: PersistenceController.shared.context)
        category.id = UUID().uuidString
        category.name = name
        category.entryType = entryType
        category.categoryType = categoryType
        PersistenceController.shared.save()
    }

    func update(id: String, name: String, entryType: EntryType, categoryType: CategoryType) {
        do {
            guard let category = try PersistenceController.shared.fetch(EntryCategory.fetchRequest().byId(id))
                    .first else { return }
            category.name = name
            category.entryType = entryType
            category.categoryType = categoryType
            PersistenceController.shared.save()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }

    func delete(_ category: EntryCategory) {
        guard category.exists() else { return }
        PersistenceController.shared.delete(category)
        PersistenceController.shared.save()
    }

    static func sample() -> CategoryModel {
        let model = CategoryModel()

        let purchInvoice = EntryCategory()
        purchInvoice.name = "Fattura Acquisto"
        purchInvoice.entryType = .expense
        purchInvoice.categoryType = .expected
        
        let saleInvoice = EntryCategory()
        saleInvoice.name = "Fattura Vendita"
        saleInvoice.entryType = .income
        saleInvoice.categoryType = .expected

        let salary = EntryCategory()
        salary.name = "Salario"
        salary.entryType = .expense
        salary.categoryType = .expected

        model.list = [purchInvoice, saleInvoice, salary]
        return model
    }
}

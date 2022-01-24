import Foundation
import CoreData

enum EntryType: String, Identifiable, CaseIterable, Codable {
    var id: String { rawValue }

    case income = "INCM"
    case expense = "EXPS"

    var localized: String {
        Localized.string(rawValue)
    }
}

enum CategoryType: String, Identifiable, CaseIterable, Codable {
    var id: String { rawValue }

    case forecast = "FRCT"
    case expected = "EXPD"
    case concrete = "CNCT"

    var localized: String {
        Localized.string(rawValue)
    }
}

@objc(EntryCategory)
public class EntryCategory: NSManagedObject {
    var entryType: EntryType = .income
    var categoryType: CategoryType = .expected
}

import Foundation

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

class EntryCategory: Identifiable, Codable {
    var id = UUID()
    var name: String
    var entryType: EntryType
    var categoryType: CategoryType
    
    init(name: String,
         entryType: EntryType,
         categoryType: CategoryType) {
        self.name = name
        self.entryType = entryType
        self.categoryType = categoryType
    }
}

extension EntryCategory {
    static func mock(name: String = "Sample Category",
                     entryType: EntryType = .expense,
                     categoryType: CategoryType = .concrete) -> EntryCategory {
        EntryCategory(name: name,
                      entryType: entryType,
                      categoryType: categoryType)
    }
}

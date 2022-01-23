import Foundation

struct Localized {
    static func string(_ key: String) -> String {
        NSLocalizedString(key, comment: "")
    }
}

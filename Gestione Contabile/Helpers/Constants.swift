import Foundation

struct Constants {
    
    struct Formatters {
        static func numberFormatter(locale: Locale = .current, style: NumberFormatter.Style = .currency) -> NumberFormatter {
            let formatter = NumberFormatter()
            formatter.locale = locale
            formatter.numberStyle = style
            return formatter
        }
    }
    
    struct CommonStrings {
        static let emptyString = ""
    }
    
}

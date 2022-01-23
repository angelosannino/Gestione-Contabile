import Foundation

extension Double {
    var currencyString: String {
        let formatter = NumberFormatter()
        formatter.currencyCode = "EUR"
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)).notNil
    }
}

extension String {
    func removeNegative(when condition: Bool) -> String {
        if condition {
            return String(self.dropFirst())
        }
        return self
    }
}

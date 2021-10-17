import Foundation

extension Double {
    var currencyString: String {
        Constants.Formatters.numberFormatter().string(from: NSNumber(value: self)).notNil
    }
    func negative(_ isNegative: Bool) -> Double {
        if isNegative { return -self }
        return self
    }
}

extension Swift.Optional where Wrapped == String {
    public var notNil: String {
        self ?? Constants.CommonStrings.emptyString
    }
}

import Foundation

public extension Swift.Optional where Wrapped == String {
    var notNil: String {
        if let text = self {
            return text
        }
        return Constants.CommonStrings.emptyString
    }
}

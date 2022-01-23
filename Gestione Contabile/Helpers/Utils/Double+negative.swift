import Foundation

extension Double {
    func negative(when condition: Bool) -> Double {
        if condition {
            return -self
        }
        return self
    }
    
    var isNegative: Bool {
        return self < 0
    }
}

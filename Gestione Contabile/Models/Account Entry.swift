import Foundation
import Extensions
import Constants

enum AccountType: String, Identifiable, Decodable {
    var id: String { rawValue }
    case income = "Income"
    case expense = "Expense"
}

class AccountEntry: Decodable {
    
    let id: Int
    let totalAmount: Double
    let description: String
    let expiryDate: Date
    
    let type: AccountType
    
    init(id: Int, totalAmount: Double, description: String, expiryDate: Date, type: AccountType) {
        self.id = id
        self.totalAmount = totalAmount
        self.description = description
        self.expiryDate = expiryDate
        self.type = type
    }
    
    var amountToShow: String {
        totalAmount.negative(when: type == .expense).currencyString
    }
    
}

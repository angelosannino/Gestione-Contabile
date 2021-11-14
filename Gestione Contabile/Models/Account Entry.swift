import Foundation

class AccountEntry: Decodable {
    
    let id: Int
    let totalAmount: Double
    let description: String
    let expiryDate: Date
    
    let isExpense: Bool
    
    init(id: Int, totalAmount: Double, description: String, expiryDate: Date, isExpense: Bool = true) {
        self.id = id
        self.totalAmount = totalAmount
        self.description = description
        self.expiryDate = expiryDate
        self.isExpense = isExpense
    }
    
//    var amountToShow: String {
//        totalAmount.negative(isExpense).currencyString
//    }
    
}

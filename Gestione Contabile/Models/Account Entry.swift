import Foundation

class AccountEntry: Identifiable, Codable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case number = "number"
        case totalAmount = "totalAmount"
    }

    var id = UUID()
    var number: Int
    var totalAmount: Double
    var paid: Bool
    var paidAmount: Double
    var description: String
    var category: EntryCategory
    var subject: Subject
    var issueDate: Date
    var expiryDate: Date
    var paymentDate: Date?

    var recurrence: Recurrence?

    init(number: Int,
         totalAmount: Double,
         paid: Bool = false,
         paidAmount: Double = 0,
         description: String,
         category: EntryCategory,
         subject: Subject,
         issueDate: Date,
         expiryDate: Date,
         recurrence: Recurrence? = nil) {
        self.number = number
        self.totalAmount = totalAmount
        self.paid = paid
        self.paidAmount = paidAmount
        self.description = description
        self.category = category
        self.subject = subject
        self.issueDate = issueDate
        self.expiryDate = expiryDate
        self.recurrence = recurrence
        self.paymentDate = expiryDate
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.number = try container.decode(Int.self, forKey: .number)
        self.totalAmount = try container.decode(Double.self, forKey: .totalAmount)
        self.paid = false
        self.paidAmount = 0.0
        self.description = ""
        self.category = EntryCategory(context: PersistenceController.shared.container.viewContext)
        self.subject = Subject.mock()
        self.issueDate = Date()
        self.expiryDate = Date()
        self.recurrence = nil
    }

    var computeAmount: Double {
        totalAmount.negative(when: category.entryType == .expense)
    }
    
    var amountToShow: String {
        computeAmount.currencyString.removeNegative(when: computeAmount.isNegative)
    }
}

extension AccountEntry {
    static func mock(number: Int = 1,
                     totalAmount: Double = 500.30,
                     paid: Bool = false,
                     paidAmount: Double = 0,
                     description: String = "Sample Entry",
                     category: EntryCategory = .mock(),
                     subject: Subject = .mock(),
                     issueDate: Date = Date(),
                     expiryDaye: Date = Date().addingTimeInterval(1200),
                     recurrence: Recurrence? = nil) -> AccountEntry {
        AccountEntry(number: number,
                     totalAmount: totalAmount,
                     paid: paid,
                     paidAmount: paidAmount,
                     description: description,
                     category: category,
                     subject: subject,
                     issueDate: issueDate,
                     expiryDate: expiryDaye,
                     recurrence: recurrence)
    }
}

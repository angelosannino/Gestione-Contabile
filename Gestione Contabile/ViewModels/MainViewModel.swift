import Foundation
import SwiftUI

class MainViewModel: ObservableObject {

    @Published var allEntries: [AccountEntry] = []
    @Published var currentMonth = DateInterval()

    @Published var subjects: SubjectModel = SubjectModel()
    @Published var categories: CategoryModel = CategoryModel()

    init() {
        loadSampleData()
    }

    func monthlyEntries(for month: DateInterval) -> [AccountEntry] {
        allEntries.filter { month.contains($0.expiryDate) }
    }

    static func sample() -> MainViewModel {
        let viewModel = MainViewModel()
        viewModel.categories = .sample()
        viewModel.subjects = .sample()

        let purch1 = AccountEntry(number: 1, totalAmount: 200.50, paidAmount: 200.50, description: "Acquisto Verricello", category: viewModel.categories.list[0], subject: viewModel.subjects.list[2], issueDate: Date(), expiryDate: Date().addingTimeInterval(200))
        let purch2 = AccountEntry(number: 2, totalAmount: 300.40, description: "Acquisto Bombolette", category: viewModel.categories.list[0], subject: viewModel.subjects.list[3], issueDate: Date(), expiryDate: Date().addingTimeInterval(500))
        let purch3 = AccountEntry(number: 2, totalAmount: 900.40, description: "Acquisto Bombolette", category: viewModel.categories.list[0], subject: viewModel.subjects.list[3], issueDate: Date(), expiryDate: Date().addingTimeInterval(3_000_000))
        let sale1 = AccountEntry(number: 1, totalAmount: 1350.30, paidAmount: 1000, description: "Vendita Verricello", category: viewModel.categories.list[1], subject: viewModel.subjects.list[0], issueDate: Date(), expiryDate: Date().addingTimeInterval(800))
        let sale2 = AccountEntry(number: 2, totalAmount: 550.20, description: "Vendita Bombolette", category: viewModel.categories.list[1], subject: viewModel.subjects.list[1], issueDate: Date(), expiryDate: Date().addingTimeInterval(1200))
        let sale3 = AccountEntry(number: 3, totalAmount: 1550.20, description: "Vendita Bombolette", category: viewModel.categories.list[1], subject: viewModel.subjects.list[1], issueDate: Date(), expiryDate: Date().addingTimeInterval(3_000_000))
        let sal1 = AccountEntry(number: 1, totalAmount: 500, description: "Salario Alessia", category: viewModel.categories.list[2], subject: viewModel.subjects.list[4], issueDate: Date(), expiryDate: Date())
        let sal2 = AccountEntry(number: 2, totalAmount: 500, description: "Salario Nessa", category: viewModel.categories.list[2], subject: viewModel.subjects.list[5], issueDate: Date(), expiryDate: Date())
        
        viewModel.allEntries = [purch1, purch2, purch3, sale1, sale2, sale3, sal1, sal2]
        return viewModel
    }

    private func loadSampleData() {
        let customer = SubjectType()
        customer.id = UUID().uuidString
        customer.name = "Cliente"
        let supplier = SubjectType()
        supplier.id = UUID().uuidString
        supplier.name = "Fornitore"
        let employee = SubjectType()
        employee.id = UUID().uuidString
        employee.name = "Implegato"
        
        let cus1 = Subject()
        cus1.id = UUID().uuidString
        cus1.name = "IDEA MARE"
        cus1.type = customer
        let cus2 = Subject()
        cus2.id = UUID().uuidString
        cus2.name = "GAMAR"
        cus2.type = customer
        let supp1 = Subject()
        supp1.id = UUID().uuidString
        supp1.name = "LALIZAS"
        supp1.type = supplier
        let supp2 = Subject()
        supp2.id = UUID().uuidString
        supp2.name = "REPAINT"
        supp2.type = supplier
        let empl1 = Subject()
        empl1.id = UUID().uuidString
        empl1.name = "Alessia"
        empl1.type = employee
        let empl2 = Subject()
        empl2.id = UUID().uuidString
        empl2.name = "Nessa"
        empl2.type = employee

        subjects.types = [customer, supplier, employee]
        subjects.list = [cus1, cus2, supp1, supp2, empl1, empl2]

        let purchInvoice = EntryCategory()
        purchInvoice.name = "Fattura Acquisto"
        purchInvoice.entryType = .expense
        purchInvoice.categoryType = .expected
        
        let saleInvoice = EntryCategory()
        saleInvoice.name = "Fattura Vendita"
        saleInvoice.entryType = .income
        saleInvoice.categoryType = .expected

        let salary = EntryCategory()
        salary.name = "Salario"
        salary.entryType = .expense
        salary.categoryType = .expected

        categories.list = [purchInvoice, saleInvoice, salary]

        let purch1 = AccountEntry(number: 1, totalAmount: 200.50, paidAmount: 200.50, description: "Acquisto Verricello", category: purchInvoice, subject: supp1, issueDate: Date(), expiryDate: Date().addingTimeInterval(200))
        let purch2 = AccountEntry(number: 2, totalAmount: 300.40, description: "Acquisto Bombolette", category: purchInvoice, subject: supp2, issueDate: Date(), expiryDate: Date().addingTimeInterval(500))
        let purch3 = AccountEntry(number: 2, totalAmount: 900.40, description: "Acquisto Bombolette", category: purchInvoice, subject: supp2, issueDate: Date(), expiryDate: Date().addingTimeInterval(3_000_000))
        let sale1 = AccountEntry(number: 1, totalAmount: 1350.30, paidAmount: 1000, description: "Vendita Verricello", category: saleInvoice, subject: cus1, issueDate: Date(), expiryDate: Date().addingTimeInterval(800))
        let sale2 = AccountEntry(number: 2, totalAmount: 550.20, description: "Vendita Bombolette", category: saleInvoice, subject: cus2, issueDate: Date(), expiryDate: Date().addingTimeInterval(1200))
        let sale3 = AccountEntry(number: 3, totalAmount: 1550.20, description: "Vendita Bombolette", category: saleInvoice, subject: cus2, issueDate: Date(), expiryDate: Date().addingTimeInterval(3_000_000))
        let sal1 = AccountEntry(number: 1, totalAmount: 500, description: "Salario Alessia", category: salary, subject: empl1, issueDate: Date(), expiryDate: Date())
        let sal2 = AccountEntry(number: 2, totalAmount: 500, description: "Salario Nessa", category: salary, subject: empl2, issueDate: Date(), expiryDate: Date())

        allEntries = [purch1, purch2, purch3, sale1, sale2, sale3, sal1, sal2]
    }

}

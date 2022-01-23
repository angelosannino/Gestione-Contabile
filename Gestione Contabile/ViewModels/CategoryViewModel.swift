import Foundation

class CategoryViewModel: ObservableObject {
    @Published var list: [EntryCategory] = []

    static func sample() -> CategoryViewModel {
        let viewModel = CategoryViewModel()

        let purchInvoice = EntryCategory(name: "Fattura Acquisto",
                                         entryType: .expense,
                                         categoryType: .expected)
        let saleInvoice = EntryCategory(name: "Fattura Vendita",
                                        entryType: .income,
                                        categoryType: .expected)
        let salary = EntryCategory(name: "Salario",
                                   entryType: .expense,
                                   categoryType: .expected)

        viewModel.list = [purchInvoice, saleInvoice, salary]
        return viewModel
    }
}

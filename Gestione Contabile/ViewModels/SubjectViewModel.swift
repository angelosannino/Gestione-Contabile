import Foundation

class SubjectViewModel: ObservableObject {
    @Published var list: [Subject] = []
    @Published var types: [SubjectType] = []

    static func sample() -> SubjectViewModel {
        let viewModel = SubjectViewModel()

        let customer = SubjectType(name: "Cliente")
        let supplier = SubjectType(name: "Fornitore")
        let employee = SubjectType(name: "Impiegato")
        
        let cus1 = Subject(name: "IDEA MARE", type: customer)
        let cus2 = Subject(name: "GAMAR", type: customer)
        let supp1 = Subject(name: "LALIZAS", type: supplier)
        let supp2 = Subject(name: "REPAINT", type: supplier)
        let empl1 = Subject(name: "Alessia", type: employee)
        let empl2 = Subject(name: "Nessa", type: employee)

        viewModel.types = [customer, supplier, employee]
        viewModel.list = [cus1, cus2, supp1, supp2, empl1, empl2]

        return viewModel
    }

    func new(name: String, type: SubjectType) {
        let subject = Subject(name: name, type: type)
        list.append(subject)
        sort()
    }

    func edit(id: UUID, name: String, type: SubjectType) {
        guard let subject = list.first(where: { $0.id == id }) else { return }
        subject.name = name
        subject.type = type
        sort()
    }

    func sort() {
        list.sort { $0.name < $1.name }
    }

    func newType(name: String) {
        let type = SubjectType(name: name)
        types.append(type)
        sortTypes()
    }

    func editType(id: UUID, name: String) {
        guard let type = types.first(where: { $0.id == id }) else { return }
        type.name = name
        sortTypes()
    }

    func deleteType(id: UUID) {
        guard let index = types.firstIndex(where: { $0.id == id }) else { return }
        types.remove(at: index)
    }

    func filteredTypes(by text: String) -> [SubjectType] {
        types.filter { $0.name.contains(text) }
    }

    func sortTypes() {
        types.sort { $0.name < $1.name }
    }
}

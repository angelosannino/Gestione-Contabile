import Foundation

class SubjectModel: ObservableObject {
    @Published var list: [Subject] = []
    @Published var types: [SubjectType] = []

    func new(name: String, type: SubjectType) {
        let subject = Subject(context: PersistenceController.shared.context)
        subject.id = UUID().uuidString
        subject.name = name
        subject.type = type
        PersistenceController.shared.save()
    }

    func update(id: String, name: String, type: SubjectType) {
        let request = Subject.fetchRequest()
        let predicate = NSPredicate(format: "id == %@", id)
        request.predicate = predicate
        do {
            guard let subject = try PersistenceController.shared.fetch(request)
                    .first else { return }
            subject.name = name
            subject.type = type
            PersistenceController.shared.save()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }

    func delete(_ subject: Subject) {
        guard subject.exists() else { return }
        PersistenceController.shared.delete(subject)
        PersistenceController.shared.save()
    }

    func newType(name: String) {
        let type = SubjectType(context: PersistenceController.shared.context)
        type.id = UUID().uuidString
        type.name = name
        PersistenceController.shared.save()
    }

    func editType(id: String, name: String) {
        do {
            guard let type = try PersistenceController.shared.fetch(SubjectType.by(id)).first else { return }
            type.name = name
            PersistenceController.shared.save()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }

    func deleteType(_ type: SubjectType) {
        guard type.exists() else { return }
        PersistenceController.shared.delete(type)
        PersistenceController.shared.save()
    }

    static func sample() -> SubjectModel {
        let model = SubjectModel()

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

        model.types = [customer, supplier, employee]
        model.list = [cus1, cus2, supp1, supp2, empl1, empl2]

        return model
    }
}

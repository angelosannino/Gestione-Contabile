import Foundation
import CoreData


extension Subject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Subject> {
        return NSFetchRequest<Subject>(entityName: "Subject")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var type: SubjectType?

    public var getId: String {
        id.notNil
    }

    public var getName: String {
        name.notNil
    }

}

extension Subject {
    func exists() -> Bool {
        do {
            return try !PersistenceController.shared.fetch(Subject.fetchRequest().byId(getId)).isEmpty
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }
    }
}

extension Subject {
    static func mock(name: String = "Sample Type",
                     type: SubjectType = .mock()) -> Subject {
        let subject = Subject()
        subject.id = UUID().uuidString
        subject.name = name
        subject.type = type
        return subject
    }

    static func unknown() -> Subject {
        let subject = Subject()
        subject.id = UUID().uuidString
        subject.name = "Unknown Subject"
        subject.type = .unknown()
        return subject
    }
}

extension Subject : Identifiable {

}

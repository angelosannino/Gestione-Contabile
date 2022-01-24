import Foundation
import CoreData


extension SubjectType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SubjectType> {
        return NSFetchRequest<SubjectType>(entityName: "SubjectType")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var subject: NSSet?

    public var getId: String {
        id.notNil
    }

    public var getName: String {
        name.notNil
    }

    public var subjects: [Subject] {
        let subjects = subject as? Set<Subject> ?? []
        return subjects.sorted {
            $0.getName < $1.getName
        }
    }

}

extension SubjectType {
    func exists() -> Bool {
        do {
            return try !PersistenceController.shared.fetch(SubjectType.fetchRequest().byId(getId)).isEmpty
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }
    }
}

extension SubjectType {
    static func mock(name: String = "Sample Subject Type") -> SubjectType {
        let type = SubjectType()
        type.id = UUID().uuidString
        type.name = name
        type.subject = []
        return type
    }

    static func unknown() -> SubjectType {
        let type = SubjectType()
        type.id = UUID().uuidString
        type.name = "Unknown Subject Type"
        type.subject = []
        return type
    }
}

// MARK: Generated accessors for subject
extension SubjectType {

    @objc(addSubjectObject:)
    @NSManaged public func addToSubject(_ value: Subject)

    @objc(removeSubjectObject:)
    @NSManaged public func removeFromSubject(_ value: Subject)

    @objc(addSubject:)
    @NSManaged public func addToSubject(_ values: NSSet)

    @objc(removeSubject:)
    @NSManaged public func removeFromSubject(_ values: NSSet)

}

extension SubjectType : Identifiable {

}

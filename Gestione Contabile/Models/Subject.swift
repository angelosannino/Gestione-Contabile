//import Foundation
//
//class SubjectType: Identifiable, Codable {
//    var id = UUID()
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class Subject: Identifiable, Codable {
//    var id = UUID()
//    var name: String
//    var type: SubjectType
//
//    init(name: String,
//         type: SubjectType) {
//        self.name = name
//        self.type = type
//    }
//}
//
//extension SubjectType {
//    static func mock(name: String = "Sample Type") -> SubjectType {
//        SubjectType(name: name)
//    }
//}
//
//extension Subject {
//    static func mock(name: String = "Sample Subject",
//                     type: SubjectType = .mock()) -> Subject {
//        Subject(name: name,
//                type: type)
//    }
//}

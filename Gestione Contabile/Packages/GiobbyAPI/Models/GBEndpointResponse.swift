import Foundation

struct GBEndpointResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case errorCode = "errorCode"
        case responseCode = "responseCode"
        case developerMessage = "developerMessage"
        case endpoint = "GiobbyApiURL"
        case warningMessages = "concatWarningMessages"
        case userMessage = "userMessage"
    }
    
    let errorCode: Int?
    let responseCode: Int?
    let developerMessage: String?
    let endpoint: String?
    let warningMessages: String?
    let userMessage: String?
}

import Foundation

protocol JWTDecoderProtocol {
    func decode(jwtToken jwt: String) -> [String: Any]
    func base64UrlDecode(_ value: String) -> Data?
    func decodeJWTPart(_ value: String) -> [String: Any]?
}

protocol AuthorizationServiceProtocol {
    var jwtDecoder: JWTDecoderProtocol { get }
    func getLoginDetails() async -> LoginDetails?
    func getAccessToken() async -> String
}

protocol GiobbyAPIServiceProtocol {
    var authorizationService: AuthorizationServiceProtocol { get }
    func getDocs<T: Decodable>(for url: String, with loginDetails: LoginDetails, expecting: T.Type) async throws -> T
}

struct LoginDetails {
    
}

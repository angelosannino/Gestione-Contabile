import Foundation

protocol GBServiceProtocol {
}

protocol JWTDecoderProtocol {
    func decode(jwtToken jwt: String) -> [String: Any]
    func base64UrlDecode(_ value: String) -> Data?
    func decodeJWTPart(_ value: String) -> [String: Any]?
}

protocol GBAuthorizationServiceProtocol {
    func getAccessTokenResponse() async -> GBAccessTokenResponse?
    func getCompanyId(from token: String) -> String
    func getEndpointResponse() async -> GBEndpointResponse?
}

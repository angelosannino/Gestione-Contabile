import Foundation

class JWTDecoder: JWTDecoderProtocol {
    
    func decode(jwtToken jwt: String) -> [String : Any] {
        [:]
    }
    
    func base64UrlDecode(_ value: String) -> Data? {
        nil
    }
    
    func decodeJWTPart(_ value: String) -> [String : Any]? {
        nil
    }
    
}

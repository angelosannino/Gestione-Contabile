import Foundation

class GiobbyAuthorizationService: AuthorizationServiceProtocol {
    
    var jwtDecoder: JWTDecoderProtocol
    
    func getLoginDetails() async -> LoginDetails? {
        nil
    }
    
    func getAccessToken() async -> String {
        ""
    }
    
    init(decoder: JWTDecoderProtocol = JWTDecoder()) {
        self.jwtDecoder = decoder
    }

}

import Foundation

struct GiobbyAPIAccessTokenResponse: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case refreshExpiresIn = "refresh_expires_in"
        case refreshToken = "refresh_token"
        case tokenType = "token_type"
        case notBeforePolicy = "not-before-policy"
        case sessionState = "session_state"
    }
    
    let accessToken: String?
    let expiresIn: Int?
    let refreshExpiresIn: Int?
    let refreshToken: String?
    let tokenType: String?
    let notBeforePolicy: Int?
    let sessionState: String?
    
}

extension GiobbyAPIAccessTokenResponse {
    static func mock(accessToken: String = "Sample Access Token",
                     expiresIn: Int = 315360000,
                     refreshExpiresIn: Int = 60,
                     refreshToken: String = "Sample Refresh Token",
                     tokenType: String = "bearer",
                     notBeforePolciy: Int = 1516631905,
                     sessionState: String = "dcbd41d6-e96b-4cdc-8e64-8e0b87e99226") -> GiobbyAPIAccessTokenResponse {
        let result = self.init(accessToken: accessToken,
                               expiresIn: expiresIn,
                               refreshExpiresIn: refreshExpiresIn,
                               refreshToken: refreshToken,
                               tokenType: tokenType,
                               notBeforePolicy: notBeforePolciy,
                               sessionState: sessionState)
        return result
    }
}

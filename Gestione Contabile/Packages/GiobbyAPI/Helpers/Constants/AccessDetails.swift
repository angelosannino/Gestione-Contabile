import Foundation

extension Constants {
    
    public struct AccessDetails {
        
        public struct Keys {
            public static let grantType = "grant_type"
            public static let accessToken = "access_token"
            public static let refreshToken = "refresh_token"
            public static let clientId = "client_id"
            public static let username = "username"
            public static let cid = "cid"
            public static let password = "password"
            public static let idCompany = "idCompany"
            public static let endPoint = "GiobbyApiURL"
        }
        
        public struct Values {
            public static let grantType = "password"
            public static let clientId = "VIN20210630-api-vinco"
            public static let username = "giobby"
            public static let cid = "api-vinco"
            public static let password = "testtest"
            public static let refreshToken = "refresh_token"
        }
        
        public struct URL {
            public static let redirectUri = ""
            public static let authBase = "https://auth.giobby.com/auth/realms/api-client/protocol/openid-connect/auth"
            public static let authFull = "\(authBase)?client_id=\(Constants.AccessDetails.Values.clientId)&redirect_uri=\(redirectUri)&response_mode=fragment&response_type=code&scope=openid"
            public static let token = "https://authqa.giobby.com/auth/realms/api-server/protocol/openid-connect/token"
            public static let endPoint = "https://qa.giobby.com/GiobbyApiLogin/v1/endpoint?idCompany="
        }
        
        public static var tokenRequestBody: [String: String] {
            [
                self.Keys.grantType : self.Values.grantType,
                self.Keys.clientId : self.Values.clientId,
                self.Keys.username : self.Values.username,
                self.Keys.cid : self.Values.cid,
                self.Keys.password : self.Values.password
            ]
        }
        
        public static func headers(with token: String) -> [String: String] {
            [
                "Accept" : "application/json",
                "Authorization" : "Bearer \(token)",
                "X-Giobby-Realm" : "api-server"
            ]
        }
        
    }
    
}

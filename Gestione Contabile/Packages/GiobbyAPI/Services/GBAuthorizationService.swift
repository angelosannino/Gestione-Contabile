import Foundation

class GBAuthorizationService: GBServiceProtocol, GBAuthorizationServiceProtocol {
    func getAccessTokenResponse() async -> GBAccessTokenResponse? {
        guard let url = URL(string: Constants.AccessDetails.URL.token) else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setBody(from: Constants.AccessDetails.tokenRequestBody)
        
        let response = try? await URLSession.shared.getAPIResponse(from: request, expecting: GBAccessTokenResponse.self)
        return response
    }
    
    func getCompanyId(from token: String) -> String {
        let decoded = JWTDecoder.decode(jwtToken: token)
        let idCompany = decoded[Constants.AccessDetails.Keys.idCompany] as? String
        return idCompany.notNil
    }
    
    func getEndpointResponse() async -> GBEndpointResponse? {
        let token = await getAccessTokenResponse()?.accessToken
        let idCompany = getCompanyId(from: token.notNil)
        guard let url = URL(string: Constants.AccessDetails.URL.endPoint + idCompany) else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(GBEndpointResponse.self, from: data)
            return result
        } catch {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}

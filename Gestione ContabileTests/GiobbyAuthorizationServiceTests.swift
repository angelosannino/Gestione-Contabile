import XCTest
@testable import Gestione_Contabile

class GiobbyAuthorizationServiceTests: XCTestCase {
    
    var sut: GiobbyAuthorizationService?

    override func setUp() {
        super.setUp()
        self.sut = GiobbyAuthorizationService()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_getToken_fromGiobbyAPIAccessTokenResponse_mapsFieldsCorrectly() {
        let input: GiobbyAPIAccessTokenResponse = .mock(accessToken: "Sample Access Token")
        let expected = "Sample Access Token"
        
    }

}

import Foundation

public extension URLRequest {
    mutating func setBody(from json: [String: String]) {
        var components = URLComponents()
        components.queryItems = json.map { URLQueryItem(name: $0.key, value: $0.value) }
        self.httpBody = components.query?.data(using: .utf8)
    }
}

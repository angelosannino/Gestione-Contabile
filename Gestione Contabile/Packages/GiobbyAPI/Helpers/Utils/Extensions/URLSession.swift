import Foundation

public extension URLSession {
    func getAPIResponse<T: Decodable>(from request: URLRequest, expecting: T.Type) async throws -> T {
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(expecting, from: data)
        } catch {
            debugPrint(error.localizedDescription)
            throw error
        }
    }
}

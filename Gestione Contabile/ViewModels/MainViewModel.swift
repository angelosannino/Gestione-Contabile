import Foundation

class MainViewModel: ObservableObject {
    
    @Published var allEntries: [AccountEntry] = []
    
}

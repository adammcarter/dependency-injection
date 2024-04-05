import Foundation

// Make the thing

@Observable
class DataService {
    private(set) var isLoading = false
    
    func fetchName() async -> String {
        isLoading = true
        
        try? await Task.sleep(for: .seconds(3))
        
        isLoading = false
        
        return "Real name"
    }
}


extension DataService {
    static func preview() -> DataService {
        .init()
    }
}

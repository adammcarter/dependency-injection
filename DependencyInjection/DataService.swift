import Foundation

// Make the thing

struct DataRepository {
    private(set) var isLoading = false
    
    mutating func fetchName() async -> String {
        isLoading = true
        
        try? await Task.sleep(for: .seconds(3))
        
        isLoading = false
        
        return "Real name"
    }
}

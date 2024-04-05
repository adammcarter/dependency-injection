import Foundation

// Make the thing

@Observable
class DataRepository {
    private(set) var isLoading = false
    
    func fetchName() async -> String {
        isLoading = true
        
        try? await Task.sleep(for: .seconds(3))
        
        isLoading = false
        
        return "Real name"
    }
}

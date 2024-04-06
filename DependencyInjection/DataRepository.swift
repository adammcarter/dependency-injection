import Foundation

// Make the thing

@Observable
class DataRepository {
    private(set) var isLoading: Bool
    
    private let urlSession: URLSession
    
    init(
        isLoading: Bool = false,
        urlSession: URLSession
    ) {
        self.isLoading = isLoading
        self.urlSession = urlSession
    }
    
    func fetchName() async throws -> String {
        isLoading = true
        
        try await Task.sleep(for: .seconds(3))
        
        let (data, _) = try await urlSession.data(
            from: .init(string: "https://jsonplaceholder.typicode.com/posts/1")!
        )
        
        let post = try JSONDecoder().decode(Post.self, from: data)
        
        isLoading = false
        
        return post.title
    }
}

extension DataRepository {
    static func actual() -> DataRepository {
        .init(urlSession: .actual)
    }
    
    static func preview() -> DataRepository {
        .init(urlSession: .preview())
    }
    
    static func test() -> DataRepository {
        .init(urlSession: .test())
    }
}

struct Post: Codable {
    let title: String
}

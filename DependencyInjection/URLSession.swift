import Foundation

struct URLSession {
    let _dataFromUrl: (URL) async throws -> (Data, URLResponse)
    
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await _dataFromUrl(url)
    }
    
    private init(_dataFromUrl: @escaping (URL) async throws -> (Data, URLResponse)) {
        self._dataFromUrl = _dataFromUrl
    }
}
    
extension URLSession {
    static let actual = {
        let shared = Foundation.URLSession.shared
        
        return URLSession(
            _dataFromUrl: { try await shared.data(from: $0) }
        )
    }()

    static func preview() -> URLSession {
        .init(
            _dataFromUrl: { _ in
                let post = Post(title: "Some preview title")
                let data = try! JSONEncoder().encode(post)
                
                return (data, URLResponse())
            }
        )
    }

    static func test(
        _dataFromUrl: @escaping (URL) -> (Data, URLResponse) = { _ in
            (Data(), URLResponse())
        }
    ) -> URLSession {
        .init(
            _dataFromUrl: _dataFromUrl
        )
    }
}

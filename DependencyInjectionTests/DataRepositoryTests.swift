import XCTest

@testable import DependencyInjection

final class DataRepositoryTests: XCTestCase {
    // Test the real thing
    
    var sut: DataRepository!
    
    func testFetchName() async throws {
        sut = .init(
            urlSession: .test(
                _dataFromUrl: { _ in
                    let post = Post(title: "Some test title")
                    let data = try! JSONEncoder().encode(post)
                    
                    return (data, URLResponse())
                }
            )
        )
        
        let name = try await sut.fetchName()
        
        XCTAssertEqual(name, "Some test title")
    }
}




final class SomeOtherThingTests: XCTestCase {
    // Create a fake thing to inject in SomeOtherThing
}

import XCTest

@testable import DependencyInjection

final class DataRepositoryTests: XCTestCase {
    // Test the real thing
    
    var sut: DataRepository!
    
    func testFetchName() async {
        sut = .init()
        
        let name = await sut.fetchName()
        
        XCTAssertEqual(name, "Real name")
    }
}




final class SomeOtherThingTests: XCTestCase {
    // Create a fake thing to inject in SomeOtherThing
}

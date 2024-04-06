import Foundation
import Observation
import SwiftUI

@Observable
class AppState {
    var dataRepository: DataRepository
    
    private init(dataRepository: DataRepository) {
        self.dataRepository = dataRepository
    }
}

extension AppState {
    static func make() -> AppState {
        if DebugEnvironment.isSwiftUIPreview {
            .preview()
        } else if DebugEnvironment.isRunningTests {
            .test()
        } else {
            .actual()
        }
    }
    
    static func actual() -> AppState {
        .init(
            dataRepository: .actual()
        )
    }
    
    static func preview(dataRepository: DataRepository = .preview()) -> AppState {
        .init(
            dataRepository: dataRepository
        )
    }
    
    static func test(dataRepository: DataRepository = .test()) -> AppState {
        .init(
            dataRepository: dataRepository
        )
    }
}

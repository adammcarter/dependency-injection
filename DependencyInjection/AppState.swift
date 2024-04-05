import Foundation
import Observation
import SwiftUI

@Observable
class AppState {
    var dataRepository: DataRepository
    
    init(dataRepository: DataRepository = DataRepository()) {
        self.dataRepository = dataRepository
    }
}

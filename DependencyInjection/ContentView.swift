import SwiftUI

// Use the real thing

struct ContentView: View {
    @Environment(\.dataService) private var dataService
    
    @State private var name: String = ""
    
    var body: some View {
        Group {
            if dataService.isLoading {
                ProgressView()
            } else {
                Text(name)
            }
        }
        .padding()
        .task {
            name = await dataService.fetchName()
        }
    }
}


// Use a fake thing

#Preview {
    ContentView()
        .environment(\.dataService, .preview())
}




private struct DataServiceKey: EnvironmentKey {
    static let defaultValue = DataService()
}


extension EnvironmentValues {
    var dataService: DataService {
        get { self[DataServiceKey.self] }
        set { self[DataServiceKey.self] = newValue }
    }
}

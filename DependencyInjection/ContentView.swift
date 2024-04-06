import SwiftUI

// Use the real thing

struct ContentView: View {
    @Environment(AppState.self) private var appState
    
    @State private var name: String = ""
    
    var body: some View {
        Group {
            if appState.dataRepository.isLoading {
                ProgressView()
            } else {
                Text(name)
            }
        }
        .padding()
        .task {
            do {
                name = try await appState.dataRepository.fetchName()
            } catch {
                debugPrint("Error")
            }
        }
    }
}


// Use a fake thing

#Preview {
    ContentView()
        .environment(AppState.preview())
}

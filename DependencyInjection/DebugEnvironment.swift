import Foundation

enum DebugEnvironment {
    static var isDebug: Bool {
#if DEBUG
        true
#else
        false
#endif
    }
    
    static var isSwiftUIPreview: Bool {
#if DEBUG
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
#else
        false
#endif
    }
    
    static var isRunningTests: Bool {
#if DEBUG
        ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
#else
        false
#endif
    }
}


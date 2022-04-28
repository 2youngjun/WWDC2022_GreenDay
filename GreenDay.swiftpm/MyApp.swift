import SwiftUI

@main
struct MyApp: App {
    @StateObject private var envObjectManage = EnvObjectData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(envObjectManage)
        }
    }
}

import SwiftUI

@main
struct SwiDBetaApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                UserList()
            }
        }
        .modelContainer(for: [User.self, Company.self])
    }
}

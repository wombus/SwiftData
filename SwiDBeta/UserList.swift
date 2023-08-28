import SwiftUI
import SwiftData
struct UserList: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \User.firstName, order: .forward, animation: .smooth) var users: [User]
    
    var body: some View {
        VStack {
            if users.isEmpty {
                Text("Press + to add a new user")
            } else {
                List(users) { user in
                    NavigationLink {
                        EditUser(user: user)
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(user.firstName) \(user.lastName)")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.headline)
                            Text("\(user.company.companyName)")
                                .fontWeight(.regular)
                                .font(.caption)
                            Text("\(user.company.designation)")
                                .fontWeight(.regular)
                                .font(.caption2)
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(user)
                            }
                        }
                    }
                }
            }
        } //END: VStack
        .toolbar {
            NavigationLink {
                CreateUser()
            } label: {
                Text("+")
                    .fontWeight(.bold)
                    .font(.title)
            }
        }
        
    }
}

#Preview {
    UserList()
}

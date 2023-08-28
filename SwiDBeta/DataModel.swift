import SwiftUI
import SwiftData


@Model
class User {
    var id: UUID
    var firstName: String
    var lastName: String
    var company: Company
    
    
    init(firstName: String, lastName: String, company: Company) {
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
    }
}

@Model
class Company {
    var id: UUID
    var companyName: String
    var designation: String
    
    init(companyName: String, designation: String) {
        self.id = UUID()
        self.companyName = companyName
        self.designation = designation
    }
}

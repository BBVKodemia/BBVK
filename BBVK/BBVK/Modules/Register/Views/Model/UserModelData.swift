import Foundation


struct userDataC: Codable {
    let email, name, lastName, occupation: String
    let birthDate, password, phone, identityImage: String
    let identityImageType: String
   
   init(email: String, name: String, lastName: String, birthDate: String, password: String, phone: String, identityImage: String, occupation: String, identityImageType: String) {
       self.email = email
       self.name = name
       self.lastName = lastName
       self.birthDate = birthDate
       self.password = password
       self.phone = phone
       self.identityImage = identityImage
       self.occupation = occupation
       self.identityImageType = identityImageType
   }
}

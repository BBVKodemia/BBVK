//
//  RegisteManager.swift
//  BBVK
//
//  Created by Jonathan Avila on 04/04/22.
//

import Foundation

class RegisterManager{
    let userModel = UserModel()
    let bbvkUtilities = initializerUI()
    lazy var validationEmail: Bool = false
    lazy var imageValidationBool = false
    lazy var validationPassword: Bool = false
    lazy var validationRegexPassword: Bool = false
    
    func validateEmail(emailText: String) -> Bool{
        
        
        if emailText.isValidEmail() == true{
            validationEmail=true
            userModel.userEmail = emailText
        }
        else{ validationEmail=false}
            
        return validationEmail
    }
    
    func validatingData(name: String, lastName: String, occuppation: String, birthDate: Date) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let newDate = formatter.string(from: birthDate)
        print(newDate)
        
        if name == "" || lastName == "" || occuppation == ""{
            validationEmail = false
        } else{ validationEmail = true
            userModel.userName = name
            userModel.userLastNAme = lastName
            userModel.occupation = occuppation
            userModel.userBirthDate = newDate
            print(birthDate)
        }
        return validationEmail
    }
    
    
    func validatingPhone(lada: String, phone: String) -> Bool {
        if lada == "" || phone == "" {
            validationEmail = false
        } else{ validationEmail = true
            userModel.userPhone = "\(lada)\(phone)"
            print("\(lada)\(phone)")
        }
        return validationEmail
    }
    
    func validateImage(imageText: String) -> Bool{

        if imageText != "" {
            userModel.userIdentytyImage = imageText
            imageValidationBool = true
        }
        else{
            imageValidationBool=false
        }
            
        return imageValidationBool
    }
    
    func validatingPassword(password: String, secondPassword: String) -> Bool {

        if secondPassword == "" || password == "" {
            validationPassword = false
        } else if secondPassword == password{
            validationPassword = true
            userModel.userSpecialWord = password
        }
        return validationPassword
    }
    
    func validatingRegexPassword(password: String, secondPassword: String) -> Bool {

        if secondPassword.isValidPassword() || password.isValidPassword() {
            validationRegexPassword = true
        } else {
            validationRegexPassword = false
        }
        return validationRegexPassword
    }
    
}

extension String {
   func isValidEmail() -> Bool {
      let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
      return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
   }
    
    func isValidPassword() -> Bool {
       let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$", options: .caseInsensitive)
       return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

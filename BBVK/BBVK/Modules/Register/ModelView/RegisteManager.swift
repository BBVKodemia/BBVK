//
//  RegisteManager.swift
//  BBVK
//
//  Created by Jonathan Avila on 04/04/22.
//

import Foundation

class RegisterManager{
    let userModel = UserModel()
    
    func validateEmail(emailText: String) -> Bool{
        lazy var validationEmail: Bool = false
        
        if emailText.isValidEmail() == true{
            validationEmail=true
            userModel.userEmail = emailText
        }
        else{ validationEmail=false}
            
        return validationEmail
    }
    
    
    
    
    
}

extension String {
   func isValidEmail() -> Bool {
      
      let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
      return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
   }
}

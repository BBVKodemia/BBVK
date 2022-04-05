//
//  LoginManager.swift
//  BBVK
//
//  Created by Jonathan Avila on 04/04/22.
//

import Foundation
class LoginManager{
    let defaults = UserDefaults.standard
    var validationLogin = false
    
    func setUserDefaultToken(token: String) {
        defaults.setValue(token, forKey: "loginToken")
    }
    
    func getUserDefaultToken() -> String {
        let getToken = defaults.string(forKey: "loginToken")
        print(getToken!)
        return getToken ?? ""
    }
    
    func setTandomCardGeneratons(){
        let cardNumber = randomNumbers(digits: 10)
        defaults.setValue(cardNumber, forKey: "cardNumber")
    }
    
    func getRandomCardGeneratons() -> String{
        let cardNumber = defaults.string(forKey: "cardNumber")
        return cardNumber ?? ""
    }
    
    private func randomNumbers(digits:Int) -> String {
        var number = String()
        for _ in 1...digits {
           number += "\(Int.random(in: 1...9))"
        }
        return number
    }
    
    func validatingLogin(password: String, userName: String) -> Bool {

        if userName == "" || password == "" {
            validationLogin = false
        } else {
            validationLogin = true
        }
        return validationLogin
    }


    
}


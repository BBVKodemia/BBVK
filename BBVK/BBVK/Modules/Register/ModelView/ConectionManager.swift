//
//  ConectionMAnager.swift
//  BBVK
//
//  Created by Jonathan Avila on 03/04/22.
//

import Foundation
import UIKit

struct ConnectionManager{
   let userModelInfo = UserModel()
   
   func postRegister(){
      
      // Prepare URL
      let url = URL(string: BBVKEndPoints.registerEndPoint)
      guard let requestUrl = url else { fatalError() }
      // Prepare URL Request Object
      var request = URLRequest(url: requestUrl)
      request.httpMethod = "POST"
       
      // HTTP Request Parameters which will be sent in HTTP Request Body
      let postString = "email=\(userModelInfo.userEmail)&name=\(userModelInfo.userName)&lastName=\(userModelInfo.userLastNAme)&birthDate=\(userModelInfo.userBirthDate)&password=\(userModelInfo.userSpecialWord)&phone=\(userModelInfo.userPhone)&identityImageType=\(userModelInfo.useridentityImageType)&occupation=\(userModelInfo.occupation)&identityImage=\(userModelInfo.userIdentytyImage)";
      print(postString)
      let newPosrtString = postString.replacingOccurrences(of: "+", with: "%2B")
      // Set HTTP Request Body
      request.httpBody = newPosrtString.data(using: String.Encoding.utf8);
      // Perform HTTP Request
      let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
              
              // Check for Error
              if let error = error {
                  print("Error took place \(error)")
                  return
              }
       
              // Convert HTTP Response Data to a String
              if let data = data, let dataString = String(data: data, encoding: .utf8) {
                  print("Response data string:\n \(dataString)")
              }
      }
      task.resume()
   }
}
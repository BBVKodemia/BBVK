//
//  ConectionMAnager.swift
//  BBVK
//
//  Created by Jonathan Avila on 03/04/22.
//

import Foundation
import UIKit

struct LoginConnectionManager{
    let loginManager = LoginManager()
    let defaults = UserDefaults.standard
    
    private func createRequest(url: URL,
                               httpMethod: String,
                               body: Data? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue("application/json",
                         forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        return request
    }
   
    func login(email: String, password: String, completion: @escaping(String?) -> ()) {
        let url = URL(string: BBVKEndPoints.loginEndPoint)!
        let dict = ["email": email,
                    "password": password]
        guard let data = try? JSONSerialization.data(withJSONObject: dict,
                                                     options: .prettyPrinted) else {
            return
        }
        let request = createRequest(url: url, httpMethod: "POST", body: data)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {
                return completion(nil)
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                guard let info = json as? [String: Any],
                      let token = info["token"] as? String,
                      let _ = info["expiresIn"] as? String  else {
                          return completion(nil)
                      }
                loginManager.setUserDefaultToken(token: token)
                completion(token)

            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}

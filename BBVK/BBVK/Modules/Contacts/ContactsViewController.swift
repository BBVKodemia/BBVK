//
//  ContactsViewController.swift
//  BBVK
//
//  Created by Saúl Pérez on 04/04/22.
//

import UIKit

class ContactsViewController: UIViewController {
    
    let bbvkUtilities = initializerUI()
    let constantes = constants()
    var userLabel: String = ""
    var moneyLabel: String = "0.00"
    let contactsTV = UITableView()
    let addUserButton = UIImageView()
    var contacts = [Contacts]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllContacts()
        initUI()
    }
    
    func initUI() {
        bbvkUtilities.HomeViewController(viewControllerParam: view)
        
      
        let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "Inicio")
        view.addSubview(arrowButton)
        arrowButton.addAnchors(left: 20, top: 150, right: nil , bottom: nil)
        arrowButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        view.addSubview(addUserButton)
        addUserButton.translatesAutoresizingMaskIntoConstraints = false
        addUserButton.addAnchors(left: nil, top: 150, right: 20, bottom: nil)
        addUserButton.image = UIImage(systemName: "person.badge.plus")
        addUserButton.clipsToBounds = true
        addUserButton.layer.masksToBounds = true
        addUserButton.layer.borderColor = UIColor.white.cgColor
        addUserButton.layer.borderWidth = 3
        addUserButton.isUserInteractionEnabled = true
        addUserButton.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                  action: #selector(newContact)))
        addUserButton.contentMode = .scaleAspectFill
        
        
    }
    
    
    private func getAllContacts() {
        let url = URL(string: "https://bankodemia.kodemia.mx/transactions/contacts")!
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MjRhNmYwNTg1NmRiYzNlMTE1ZmYyM2EiLCJpYXQiOjE2NDkxMzYxNzQsImV4cCI6MTY0OTEzOTc3NH0.G-cXUnohg2SzRth64HifEn0RT4fyHOQ55_0G1Pu5RaI"
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json",
                         forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)",
                         forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let _ = error {
                print(error)
            }
            guard let data = data else {
                return
            }
            data.printJSON()
            do {
                let recipe = try JSONDecoder().decode(AllRecipe.self, from: data)
                DispatchQueue.main.async {
                  //  self.contacts = recipe.data.contacts
                    self.contactsTV.reloadData()
                }
            }catch let error {
                print(error)
            }
            
        }.resume()
    }
    


}


struct Contacts: Codable {
    let _id: String
    let shortName: String
    let user: String
}



extension ContactsViewController{
   @objc func dismissView(){
      self.dismiss(animated: true, completion: nil)
   }
}

extension ContactsViewController{
@objc func newContact(){
      let toGoContacts = ContactsViewController()
    toGoContacts.modalPresentationStyle = .fullScreen
    present(toGoContacts, animated: true, completion: {
       
    })
  }
}

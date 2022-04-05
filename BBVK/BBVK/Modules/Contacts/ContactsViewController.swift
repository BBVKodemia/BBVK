//
//  ContactsViewController.swift
//  BBVK
//
//  Created by Saúl Pérez on 04/04/22.
//

import UIKit

class ContactsViewController: UIViewController{

    let bbvkUtilities = initializerUI()
    let constantes = constants()
    let contactsTV = UITableView()
    let addUserButton = UIImageView()
    var contacts = [Contacts]()
    let loginManager = LoginManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllContacts()
        initUI()
    }
    
    func initUI() {
        bbvkUtilities.HomeViewController(viewControllerParam: view)
        
      
        let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "Home")
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
        let welcomeLabel = bbvkUtilities.uiLabelSetter(labelString: "Contacts", labelSize: 18, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(welcomeLabel)
        welcomeLabel.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
        
        view.addSubview(contactsTV)
        contactsTV.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
            contactsTV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contactsTV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contactsTV.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            contactsTV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
         ])
        contactsTV.register(ContactsTableViewCell.self, forCellReuseIdentifier: "cell")
        contactsTV.delegate = self
        contactsTV.dataSource = self
        
        
    }
    
    
    private func getAllContacts() {
        let url = URL(string: "https://bankodemia.kodemia.mx/contacts")!
       // let token = loginManager.getUserDefaultToken() ?? ""
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MjRhNmYwNTg1NmRiYzNlMTE1ZmYyM2EiLCJpYXQiOjE2NDkxODM5MjgsImV4cCI6MTY0OTE4NzUyOH0.krFwfAfLOjZ8--9ctpa93z_0p49YEIfxw4kDrCXXfGY"
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
                let friend = try JSONDecoder().decode(AllContacts.self, from: data)
                DispatchQueue.main.async {
                    self.contacts = friend.data.contacts
                    self.contactsTV.reloadData()
                }
            }catch let error {
                print(error)
            }
            
        }.resume()
    }
    


}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ContactsTableViewCell else {
            return UITableViewCell()
        }
        cell.contact = contacts[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}


class ContactsTableViewCell: UITableViewCell {
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let tarjetaLabel = UILabel()
    
    var contact: Contacts? {
        didSet{
            guard let contact = contact else {
                return
            }
            nameLabel.text = contact.shortName
            tarjetaLabel.text = contact._id
            emailLabel.text = contact.user.email
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        //selectionStyle = .none
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
        ])
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
//        contentView.addSubview(emailLabel)
//        emailLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            emailLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
//        ])
//
        contentView.addSubview(tarjetaLabel)
        tarjetaLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tarjetaLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            tarjetaLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct AllContacts: Codable {
    let data: DataRecipe
    
    struct DataRecipe: Codable {
        let contacts: [Contacts]
    }
}

struct Contacts: Codable {
    let _id: String
    let shortName: String
    let user: User
    
    struct User: Codable {
        let email : String
    }
}





extension ContactsViewController{
   @objc func dismissView(){
      self.dismiss(animated: true, completion: nil)
   }
}

extension ContactsViewController{
@objc func newContact(){
      let toGoContacts = NewContactViewController()
    toGoContacts.modalPresentationStyle = .fullScreen
    present(toGoContacts, animated: true, completion: {
       
    })
  }
}


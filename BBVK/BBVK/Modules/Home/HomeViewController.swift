//
//  CreateAccountViewController.swift
//  BBVK
//
//  Created by user209759 on 3/15/22.
//

import UIKit

class HomeViewController: UIViewController {
    let bbvkUtilities = initializerUI()
    let constantes = constants()
    var userLabel: String = ""
    var moneyLabel: String = "0.00"
    let moneyMovementsTV = UITableView()
    var transactions = [Transaction]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        getAllTransactions()
    }
    
    func initUI()
    {
       bbvkUtilities.HomeViewController(viewControllerParam: view)
       
       let welcomLabel = bbvkUtilities.uiLabelSetter(labelString: "Welcome \(userLabel)", labelSize: 20, textaligment: .center, isBold: true, isHighLighted: false)
       view.addSubview(welcomLabel)
       welcomLabel.addAnchors(left: 20, top: 120, right: 20, bottom: nil)
       
       let moneyAvailableLabel = bbvkUtilities.uiLabelSetter(labelString: "Money Available", labelSize: 20, textaligment: .center, isBold: false, isHighLighted: false)
       view.addSubview(moneyAvailableLabel)
       moneyAvailableLabel.addAnchors(left: 20, top: 40, right: 20, bottom: nil, withAnchor: .top , relativeToView: welcomLabel)
       
       let moneyLabel = bbvkUtilities.uiLabelSetter(labelString: "$ \(moneyLabel)", labelSize: 20, textaligment: .center, isBold: true, isHighLighted: false)
       view.addSubview(moneyLabel)
       moneyLabel.addAnchors(left: 20, top: 10, right: 20, bottom: nil, withAnchor: .top , relativeToView: moneyAvailableLabel)
       
       let sendButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: true, isgreen: false, buttonText: "Send")
        sendButton.addTarget(self, action: #selector(sendMoney), for: .touchUpInside)
       let receiveButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Receive")
        receiveButton.addTarget(self, action: #selector(receiveMoney), for: .touchUpInside)
       
        
        
       let stackButtons = UIStackView(arrangedSubviews: [sendButton, receiveButton])
       stackButtons.distribution = .fillEqually
       stackButtons.spacing = 10
       stackButtons.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(stackButtons)
       stackButtons.addAnchors(left: 20, top: 40, right: 20, bottom: nil, withAnchor: .top, relativeToView: moneyLabel)
       
       
       view.addSubview(moneyMovementsTV)
        moneyMovementsTV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moneyMovementsTV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moneyMovementsTV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moneyMovementsTV.topAnchor.constraint(equalTo: stackButtons.bottomAnchor, constant: 20),
            moneyMovementsTV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        moneyMovementsTV.register(MovementTableViewCell.self, forCellReuseIdentifier: "cell")
        moneyMovementsTV.delegate = self
        moneyMovementsTV.dataSource = self
       
       
       
       let startButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: true, isgreen: false, buttonText: " Home")
       startButton.backgroundColor = .black
       startButton.setImage(UIImage(systemName: "house"), for: .normal)
       startButton.tintColor = .white
       let cardButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: " Credit Card")
       cardButton.backgroundColor = .black
       cardButton.setImage(UIImage(systemName: "creditcard"), for: .normal)
       cardButton.tintColor = .white
       let servicesButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: " Services")
       servicesButton.backgroundColor = .black
       servicesButton.setImage(UIImage(systemName: "menubar.arrow.up.rectangle"), for: .normal)
       servicesButton.tintColor = .white
       servicesButton.addTarget(self, action: #selector(goToService), for: .touchUpInside)

       let stackFooter = UIStackView(arrangedSubviews: [startButton, cardButton,servicesButton])
       stackFooter.distribution = .fillEqually
       stackFooter.spacing = 2
       stackFooter.translatesAutoresizingMaskIntoConstraints = false
       stackFooter.backgroundColor = .black
       view.addSubview(stackFooter)
       stackFooter.addAnchors(left: 0, top: (constants.height/20)*18.5, right: 0, bottom: 0)
    }
    
    
    @objc func sendMoney(){
          let toGoContacts = ContactsViewController()
        toGoContacts.modalPresentationStyle = .fullScreen
        present(toGoContacts, animated: true, completion: {
           
        })
      }
    
    @objc func receiveMoney() {
        let alert = UIAlertController(title: "Recibir", message: "Escribe la cantidad que quieres recibir", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
            guard let concept = alert.textFields?[0].text,
                  let amountString = alert.textFields?[1].text,
                  let amount = Double(amountString) else {
                self.showErrorField()
                return
            }
            self.receive(concept: concept, amount: amount)
        }))
        alert.addTextField { (textField) in
            textField.placeholder = "Concepto"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "$ 0.00"
        }
        present(alert, animated: true)
    }
    
    private func getAllTransactions() {
        let url = URL(string: "https://bankodemia.kodemia.mx/transactions/me")!
        let token = defaults.string(forKey: "LoginToken")
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
                    self.transactions = recipe.data.transactions
                    self.moneyMovementsTV.reloadData()
                }
            }catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    private func receive(concept: String, amount: Double) {
        let url = URL(string: "https://bankodemia.kodemia.mx/transactions")!
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MjRhNmYwNTg1NmRiYzNlMTE1ZmYyM2EiLCJpYXQiOjE2NDkxNDE3ODcsImV4cCI6MTY0OTE0NTM4N30.Tz1Q-NJH8-lT-sk0pt1jrn2G9U9a_YVEycazt93Zuik"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json",
                         forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)",
                         forHTTPHeaderField: "Authorization")
        let dict = ["amount": amount,
                    "concept": concept,
                    "type": "DEPOSIT"] as [String : Any]
        guard let data = try? JSONSerialization.data(withJSONObject: dict,
                                                     options: .prettyPrinted) else {
            return
        }
        request.httpBody = data
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let _ = error {
                DispatchQueue.main.async {
                    self.showErrorTransaction()
                }
            }
            guard let data = data else {
                return
            }
            data.printJSON()
            do {
                let recipe = try JSONDecoder().decode(Recipe.self, from: data)
                DispatchQueue.main.async {
                    self.present(DetailTransactionViewController(recipe: recipe),
                                 animated: true)
                    self.transactions.append(recipe.data.transaction)
                    self.moneyMovementsTV.reloadData()
                }
            }catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    private func showErrorTransaction() {
        let alert = UIAlertController(title: "Error", message: "Error al realizar la transaccion", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Acceptar", style: .default))
        present(alert, animated: true)
    }
    
    private func showErrorField() {
        let alert = UIAlertController(title: "Error", message: "Error en los campos", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Acceptar", style: .default))
        present(alert, animated: true)
    }
    
}

extension HomeViewController{
   
   @objc func goToService(){
      let detailstransactionVC = TransferMoneyViewController()
      detailstransactionVC.modalPresentationStyle = .fullScreen
      present(detailstransactionVC, animated: true, completion: nil)
   }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovementTableViewCell else {
            return UITableViewCell()
        }
        cell.transaction = transactions[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

class MovementTableViewCell: UITableViewCell {
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let priceLabel = UILabel()
    
    var transaction: Transaction? {
        didSet{
            guard let transaction = transaction else {
                return
            }
            nameLabel.text = transaction.concept
            dateLabel.text = transaction.created_at
            priceLabel.text = "$ \(transaction.amount)"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
        ])
        
        contentView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
        ])
        
        contentView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -10)
        ])
        priceLabel.textAlignment = .right
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct Recipe: Codable {
    let data: DataRecipe
    
    struct DataRecipe: Codable {
        let transaction: Transaction
        let finalBalance: Double
    }
}

struct AllRecipe: Codable {
    let data: DataRecipe
    
    struct DataRecipe: Codable {
        let transactions: [Transaction]
    }
}

struct Transaction: Codable {
    let _id: String
    let concept: String
    let type: String
    let amount: Double
    let created_at: String
}



extension Data
{
    func printJSON()
    {
        if let JSONString = String(data: self, encoding: String.Encoding.utf8)
        {
            print(JSONString)
        }
    }
}

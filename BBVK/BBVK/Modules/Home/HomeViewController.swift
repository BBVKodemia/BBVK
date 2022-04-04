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
            

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initUI()
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
       let receiveButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Receive")
       
       let stackButtons = UIStackView(arrangedSubviews: [sendButton, receiveButton])
       stackButtons.distribution = .fillEqually
       stackButtons.spacing = 10
       stackButtons.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(stackButtons)
       stackButtons.addAnchors(left: 20, top: 40, right: 20, bottom: nil, withAnchor: .top, relativeToView: moneyLabel)
       
       let moneyMovementsTV = UITableView()
       view.addSubview(moneyMovementsTV)
       moneyMovementsTV.addAnchors(left: 20, top: 30, right: 20, bottom: 200, withAnchor: .top, relativeToView: stackButtons)
       
       
       
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
}

extension HomeViewController{
   
   @objc func goToService(){
      let detailstransactionVC = TransferMoneyViewController()
      detailstransactionVC.modalPresentationStyle = .fullScreen
      present(detailstransactionVC, animated: true, completion: nil)
   }
}

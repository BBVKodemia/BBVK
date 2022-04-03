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
       moneyMovementsTV.addAnchors(left: 20, top: 30, right: 20, bottom: 100, withAnchor: .top, relativeToView: stackButtons)
       
       

    }
}

extension CreateAccountViewController{
   
   
}

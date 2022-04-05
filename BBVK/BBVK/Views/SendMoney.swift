//
//  Send Money.swift
//  BBVK
//
//  Created by Jonathan Avila on 03/04/22.
//

//
//  TransactionDetailsViewController.swift
//  BBVK
//
//  Created by Jonathan Avila on 03/04/22.
//

import Foundation
import UIKit

class SendMoneyViewController: UIViewController {
    
    let bbvkUtilities = initializerUI()
    let constantes = constants()
            

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initUI()
    }
    
    
    func initUI()
    {
       bbvkUtilities.HomeViewController(viewControllerParam: view)
       
     
       
       let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "Details of Transacion")
       view.addSubview(arrowButton)
       arrowButton.addAnchors(left: 20, top: 150, right: nil , bottom: nil)
      arrowButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
       

       let accounts = UITableView()
       view.addSubview(accounts)
       accounts.addAnchors(left: 20, top: 30, right: 20, bottom: 200, withAnchor: .top, relativeToView: arrowButton)
       
       
       
       

    }
}

extension SendMoneyViewController{
   @objc func dismissView(){
      self.dismiss(animated: true, completion: nil)
   }
   
}


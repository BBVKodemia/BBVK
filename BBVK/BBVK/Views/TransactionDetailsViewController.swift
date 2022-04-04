//
//  TransactionDetailsViewController.swift
//  BBVK
//
//  Created by Jonathan Avila on 03/04/22.
//

import Foundation
import UIKit

class TransactionDetailsViewController: UIViewController {
    
    let bbvkUtilities = initializerUI()
    let constantes = constants()
    var userLabel: String = ""
    var moneyLabel: String = "0.00"
    var Description: String = "Description Transaccion"
            

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
       

       let moneyLabel = bbvkUtilities.uiLabelSetter(labelString: "$ \(moneyLabel)", labelSize: 20, textaligment: .center, isBold: true, isHighLighted: false)
       view.addSubview(moneyLabel)
       moneyLabel.addAnchors(left: 20, top: 10, right: 20, bottom: nil, withAnchor: .top , relativeToView: arrowButton)
       
       let transactionDescription = bbvkUtilities.uiLabelSetter(labelString: "Description", labelSize: 20, textaligment: .center, isBold: false, isHighLighted: false)
       view.addSubview(transactionDescription)
       transactionDescription.addAnchors(left: 20, top: 40, right: 20, bottom: nil, withAnchor: .top , relativeToView: moneyLabel)
       
       let dateAndTimeLbl = bbvkUtilities.uiLabelSetter(labelString: "Date and Time", labelSize: 20, textaligment: .left, isBold: true, isHighLighted: false)
       view.addSubview(dateAndTimeLbl)
       dateAndTimeLbl.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top , relativeToView: transactionDescription)
       let dateAndTimeVar = bbvkUtilities.uiLabelSetter(labelString: "January", labelSize: 20, textaligment: .left, isBold: false, isHighLighted: false)
       view.addSubview(dateAndTimeVar)
       dateAndTimeVar.addAnchors(left: 20, top: 5, right: 20, bottom: nil, withAnchor: .top , relativeToView: dateAndTimeLbl)
       
       
       let idTransactionLbl = bbvkUtilities.uiLabelSetter(labelString: "Transaction ID", labelSize: 20, textaligment: .left, isBold: true, isHighLighted: false)
       view.addSubview(idTransactionLbl)
       idTransactionLbl.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top , relativeToView: dateAndTimeVar)
       
       let idTransactionVar = bbvkUtilities.uiLabelSetter(labelString: "545165415465346", labelSize: 20, textaligment: .left, isBold: false, isHighLighted: false)
       view.addSubview(idTransactionVar)
       idTransactionVar.addAnchors(left: 20, top: 5, right: 20, bottom: nil, withAnchor: .top , relativeToView: idTransactionLbl)
       
       
       let conceptLbl = bbvkUtilities.uiLabelSetter(labelString: "Concept", labelSize: 20, textaligment: .left, isBold: true, isHighLighted: false)
       view.addSubview(conceptLbl)
       conceptLbl.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top , relativeToView: idTransactionVar)
       let concepVar = bbvkUtilities.uiLabelSetter(labelString: "Compra de taquitos", labelSize: 20, textaligment: .left, isBold: false, isHighLighted: false)
       view.addSubview(concepVar)
       concepVar.addAnchors(left: 20, top: 5, right: 20, bottom: nil, withAnchor: .top , relativeToView: conceptLbl)
       
       let accounttLbl = bbvkUtilities.uiLabelSetter(labelString: "Account ", labelSize: 20, textaligment: .left, isBold: true, isHighLighted: false)
       view.addSubview(accounttLbl)
       accounttLbl.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top , relativeToView: concepVar)
       let accountVar = bbvkUtilities.uiLabelSetter(labelString: "Account Number", labelSize: 20, textaligment: .left, isBold: false, isHighLighted: false)
       view.addSubview(accountVar)
       accountVar.addAnchors(left: 20, top: 5, right: 20, bottom: nil, withAnchor: .top , relativeToView: accounttLbl)
       let accountVarNumber = bbvkUtilities.uiLabelSetter(labelString: "5324123121", labelSize: 20, textaligment: .left, isBold: false, isHighLighted: false)
       view.addSubview(accountVarNumber)
       accountVarNumber.addAnchors(left: 20, top: 5, right: 20, bottom: nil, withAnchor: .top , relativeToView: accountVar)

       
       
       
       

    }
}

extension TransactionDetailsViewController{
   @objc func dismissView(){
      self.dismiss(animated: true, completion: nil)
   }
   
}

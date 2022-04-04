//
//  TransactionDetailsViewController.swift
//  BBVK
//
//  Created by Jonathan Avila on 03/04/22.
//

import Foundation
import UIKit

class TransferMoneyViewController: UIViewController {
    
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
       
     
       
       let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "Transfer")
       view.addSubview(arrowButton)
       arrowButton.addAnchors(left: 20, top: 150, right: nil , bottom: nil)
      arrowButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
       
       let sendToLbl = bbvkUtilities.uiLabelSetter(labelString: "Send to", labelSize: 20, textaligment: .left, isBold: true, isHighLighted: false)
       view.addSubview(sendToLbl)
       sendToLbl.addAnchors(left: 20, top: 50, right: 20, bottom: nil, withAnchor: .top , relativeToView: arrowButton)
       
       
       let accountLbl = bbvkUtilities.uiLabelSetter(labelString: "Name Of Person ", labelSize: 20, textaligment: .left, isBold: true, isHighLighted: false)
       view.addSubview(accountLbl)
       accountLbl.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top , relativeToView: sendToLbl)
       let accountVar = bbvkUtilities.uiLabelSetter(labelString: "68481165168", labelSize: 20, textaligment: .left, isBold: false, isHighLighted: false)
       view.addSubview(accountVar)
       accountVar.addAnchors(left: 20, top: 5, right: 20, bottom: nil, withAnchor: .top , relativeToView: accountLbl)
       
       
       let amountNumber = bbvkUtilities.uiLabelSetter(labelString: "Amount", labelSize: 20, textaligment: .center, isBold: false, isHighLighted: false)
       view.addSubview(amountNumber)
       amountNumber.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top , relativeToView: accountVar)
       
       
       let amountNumberLbl = bbvkUtilities.uiLabelSetter(labelString: "$150", labelSize: 20, textaligment: .center, isBold: true, isHighLighted: false)
       view.addSubview(amountNumberLbl)
       amountNumberLbl.addAnchors(left: 20, top: 10, right: 20, bottom: nil, withAnchor: .top , relativeToView: amountNumber)
       
       let speiLBL = bbvkUtilities.uiLabelSetter(labelString: "SPEI sin coso", labelSize: 20, textaligment: .center, isBold: false, isHighLighted: true)
       view.addSubview(speiLBL)
       speiLBL.addAnchors(left: 20, top: 5, right: 20, bottom: nil, withAnchor: .top , relativeToView: amountNumberLbl)
       
       
       let conceptLbl = bbvkUtilities.uiLabelSetter(labelString: "Concept", labelSize: 20, textaligment: .left, isBold: true, isHighLighted: false)
       view.addSubview(conceptLbl)
       conceptLbl.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top , relativeToView: speiLBL)
       let concepVar = bbvkUtilities.uiLabelSetter(labelString: "Compra de taquitos", labelSize: 20, textaligment: .left, isBold: false, isHighLighted: false)
       view.addSubview(concepVar)
       concepVar.addAnchors(left: 20, top: 5, right: 20, bottom: nil, withAnchor: .top , relativeToView: conceptLbl)
      
      
       let makeTranfer = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Make Transfer")
       view.addSubview(makeTranfer)
       makeTranfer.addAnchors(left: 30, top: nil, right: 30, bottom: 35)
       makeTranfer.addTarget(self, action: #selector(alertFunc), for: .touchUpInside)

    }
}

extension TransferMoneyViewController{
   @objc func dismissView(){
      self.dismiss(animated: true, completion: nil)
   }
   
   
   @objc func alertFunc(){
      let alert = UIAlertController(title: "TRANSFER CONFIRMATION", message: "Would You like to proceed with the transfer?", preferredStyle: UIAlertController.Style.alert)
      
      alert.addAction(UIAlertAction(title: "Agree", style: UIAlertAction.Style.default){
         UIAlertAction in
         self.nextView()
     })

      
      present(alert, animated: true, completion: nil)
   }
   
   
   @objc func nextView(){
      let LoadingVC = LoadingProcessingViewController()
      LoadingVC.modalPresentationStyle = .fullScreen
      present(LoadingVC, animated: true, completion: nil)
   }
   
}


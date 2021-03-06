//
//  CreateAccountViewController.swift
//  BBVK
//
//  Created by user209759 on 3/15/22.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    let bbvkUtilities = initializerUI()
    let constantes = constants()
    var userEmail = ""
   var emailTextfield: UITextField = UITextField()
   var registerManager = RegisterManager()
    
    
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
       let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
       view.addGestureRecognizer(tap)
        
        initUI()
    }
    
    
    func initUI()
    {
       bbvkUtilities.MainViewController(viewControllerParam: view)
       // Arrow Button
       let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "Home")
       view.addSubview(arrowButton)
       arrowButton.addAnchors(left: 20, top: 85, right: nil , bottom: nil)
       arrowButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
       
       let indicationsLabel = bbvkUtilities.uiLabelSetter(labelString: "You will receive emails with your transactions and movements for every event", labelSize: 18, textaligment: .center, isBold: false, isHighLighted: false)
       view.addSubview(indicationsLabel)
       indicationsLabel.numberOfLines = 0
       indicationsLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
       
  
       
       let emailLabel = bbvkUtilities.uiLabelSetter(labelString: "Write your e-mail", labelSize: 14 ,textaligment:.left, isBold: true, isHighLighted: false)
               view.addSubview(emailLabel)
               emailLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: indicationsLabel)
                
                emailTextfield = bbvkUtilities.textFieldSetter(isClear: false, placeHolderString: "  example@bbvk.com", isSecure: false)
       emailTextfield.delegate = self
       view.addSubview(emailTextfield)
       emailTextfield.addAnchorsAndSize(width: nil, height: 40, left: 20, top: 5, right: 20, bottom: nil, withAnchor: .top, relativeToView: emailLabel)
      
       
       let understoodButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Cotinue")
              view.addSubview(understoodButton)
              understoodButton.addAnchors(left: 30, top: nil, right: 30, bottom: 35)
       
       understoodButton.addTarget(self, action: #selector(goCreateAccount), for: .touchUpInside)
       
       let privacidadButton = bbvkUtilities.uiLabelSetter(labelString: "Notice of Privacy", labelSize: 14 ,textaligment:.center, isBold: false, isHighLighted: true)
               view.addSubview(privacidadButton)
       privacidadButton.addAnchors(left: 20, top: nil, right: 20, bottom: 30, withAnchor: .bottom, relativeToView: understoodButton)

       
       let avisoButton = bbvkUtilities.uiLabelSetter(labelString: "Upon clicking the button you are accepting our terms of service", labelSize: 14 ,textaligment:.center, isBold: true, isHighLighted: false)
               view.addSubview(avisoButton)
        avisoButton.numberOfLines = 0
       avisoButton.addAnchors(left: 20, top: nil, right: 20, bottom: 5, withAnchor: .bottom, relativeToView: privacidadButton)
       
       

    }
}

extension CreateAccountViewController{
   
   @objc func goCreateAccount(){
       
       
       let emailValidation = registerManager.validateEmail(emailText: emailTextfield.text ?? "")
       if emailValidation == true{
       let createAccount = FormViewController()
           createAccount.registerManager = self.registerManager
       createAccount.modalPresentationStyle = .fullScreen
       present(createAccount, animated: true)
       }else{
           let alert = bbvkUtilities.alertViewSetter(tittle: "Incorrect Email Format", message: "Please verify your email", buttontittle: "ok")
                    self.present(alert, animated: true, completion: nil)
       }
     }
   
   @objc func dismissKeyboard() {
      view.endEditing(true)
   }
   
   @objc func dismissView() {
      self.dismiss(animated: true, completion: nil)
   }
   
}


extension CreateAccountViewController: UITextFieldDelegate{
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      emailTextfield.endEditing(true)
      return true
   }
   func textFieldDidEndEditing(_ textField: UITextField) {
      
   }
}

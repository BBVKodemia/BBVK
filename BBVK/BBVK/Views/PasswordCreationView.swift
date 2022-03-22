//
//  PasswordCreationView.swift
//  BBVK
//
//  Created by Jonathan Avila on 20/03/22.
//

import Foundation
import UIKit

class PasswordViewControllers: UIViewController{
   let bbvkUtilities = initializerUI()
   
   override func viewDidLoad() {
      bbvkUtilities.MainViewController(viewControllerParam: view)
      initUi()
   }
   
   func initUi (){
      // Arrow Button
      let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "CONTRASEÑA")
      view.addSubview(arrowButton)
      arrowButton.addAnchors(left: 20, top: 85, right: nil , bottom: nil)
      
      let welcomeLabel = bbvkUtilities.uiLabelSetter(labelString: "Crea una contraseña segura", labelSize: 18, textaligment: .left, isBold: true, isHighLighted: false)
      view.addSubview(welcomeLabel)
      welcomeLabel.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
      // instructions
      let instructionsLabel1 = bbvkUtilities.uiLabelSetter(labelString: "La usaras para entrar a la app y confirmar tus transacciones.", labelSize: 18, textaligment: .left, isBold: false, isHighLighted: false)
      instructionsLabel1.numberOfLines = 0
      view.addSubview(instructionsLabel1)
      instructionsLabel1.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top, relativeToView: welcomeLabel)
      
      let instructionsLabel2 = bbvkUtilities.uiLabelSetter(labelString: "usa al menos 6 caracteres alfanumericos, no consecutivos ni repetidos.", labelSize: 18, textaligment: .left, isBold: false, isHighLighted: false)
      instructionsLabel2.numberOfLines = 0
      view.addSubview(instructionsLabel2)
      instructionsLabel2.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top, relativeToView: instructionsLabel1)
      
      // label for password textfield
      let passwordLabel = bbvkUtilities.uiLabelSetter(labelString: "Contraseña", labelSize: 18, textaligment: .left, isBold: false, isHighLighted: false)
      view.addSubview(passwordLabel)
      passwordLabel.addAnchors(left: 20, top: 40, right: 20, bottom: nil, withAnchor: .top, relativeToView: instructionsLabel2)
      // password textfield
      let passwordTextField =  bbvkUtilities.textFieldSetter(isClear: true, placeHolderString: "  Contraseña", isSecure: true)
      passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
      passwordTextField.layer.borderWidth = 1
      passwordTextField.layer.cornerRadius = 3
      view.addSubview(passwordTextField)
      passwordTextField.addAnchorsAndSize(width: width/10, height: width/10, left: 20, top: 5, right: 20, bottom: nil, withAnchor: .top, relativeToView: passwordLabel)
      
      // label for confirm password textfield
      let passwordLabel2 = bbvkUtilities.uiLabelSetter(labelString: "Confirmas Contraseña", labelSize: 18, textaligment: .left, isBold: false, isHighLighted: false)
      view.addSubview(passwordLabel2)
      passwordLabel2.addAnchors(left: 20, top: 40, right: 20, bottom: nil, withAnchor: .top, relativeToView: passwordTextField)
      
      // confirm password textfield
      let passwordTextField2 =  bbvkUtilities.textFieldSetter(isClear: true, placeHolderString: "  Confirma Contraseña", isSecure: true)
      passwordTextField2.layer.borderColor = UIColor.lightGray.cgColor
      passwordTextField2.layer.borderWidth = 1
      passwordTextField2.layer.cornerRadius = 3
      view.addSubview(passwordTextField2)
      passwordTextField2.addAnchorsAndSize(width: width/10, height: width/10, left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top, relativeToView: passwordLabel2)
      
      
      
   
      
   }
   
   
}

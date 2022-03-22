//
//  ViewController.swift
//  BBVK
//
//  Created by Jonathan Avila Perez on 20/02/22.
//

import UIKit

class ViewController: UIViewController {
   
   let bbvkUtilities = initializerUI()

    override func viewDidLoad() {
        super.viewDidLoad()
       
       uiInit()
    }
   
   func uiInit(){
      bbvkUtilities.MainViewController(viewControllerParam: view)
      // Arrow Button
      let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "IDENTIDAD")
      view.addSubview(arrowButton)
      arrowButton.addAnchors(left: 20, top: 85, right: nil , bottom: nil)
      // indicator text
      let indicationsLabel = bbvkUtilities.uiLabelSetter(labelString: "Ahora, vamos a verificar tu identidad para proteger tu cuenta", labelSize: 18, textaligment: .left, isBold: true, isHighLighted: false)
      view.addSubview(indicationsLabel)
      indicationsLabel.numberOfLines = 0
      indicationsLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
      
      let instructionsLabel = bbvkUtilities.uiLabelSetter(labelString: "Deberas subir una fotografia de tu INE o pasaporte vigente y tomarte una selfie. Si eres extranjero necesitaras una fotografia de tu documento migratorio(FM3)", labelSize: 15, textaligment: .left, isBold: false, isHighLighted: false)
      instructionsLabel.textColor = constants.grayfont
      view.addSubview(instructionsLabel)
      instructionsLabel.numberOfLines = 0
      instructionsLabel.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top, relativeToView: indicationsLabel)
      
      
      let understoodButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Entendido")
      view.addSubview(understoodButton)
      understoodButton.addAnchors(left: 30, top: nil, right: 30, bottom: 35)
      
      

      
   }
      
}


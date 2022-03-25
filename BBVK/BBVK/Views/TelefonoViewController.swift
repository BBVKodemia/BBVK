//
//  TelefonoViewController.swift
//  BBVK
//
//  Created by Saúl Pérez on 03/03/22.
//

import UIKit

class TelefonoViewController: UIViewController {

    
    let bbvkUtilities = initializerUI()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    
    func initUI(){
        
        bbvkUtilities.MainViewController(viewControllerParam: view)
        // Arrow Button
        let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "ESCRIBE TU TELEFONO")
        view.addSubview(arrowButton)
        arrowButton.addAnchors(left: 20, top: 85, right: nil , bottom: nil)
        // indicator text
        let indicationsLabel = bbvkUtilities.uiLabelSetter(labelString: "Lo usarás para iniciar sesión", labelSize: 18, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(indicationsLabel)
        indicationsLabel.numberOfLines = 0
        indicationsLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
        
        //
        
        
        let understoodButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Continuar")
        view.addSubview(understoodButton)
        understoodButton.addAnchors(left: 30, top: nil, right: 30, bottom: 50)
       
        let instructionsLabel = bbvkUtilities.uiLabelSetter(labelString: "Para proteger tu cuenta, te enviaremos un código vía SMS.", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
        instructionsLabel.textColor = constants.grayfont
       view.addSubview(instructionsLabel)
        instructionsLabel.numberOfLines = 0
        instructionsLabel.addAnchors(left: 20, top: nil, right: 20, bottom: 10, withAnchor: .bottom, relativeToView: understoodButton)

        
        
    }
    

}

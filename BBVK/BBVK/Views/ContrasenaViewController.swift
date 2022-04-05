//
//  ContrasenaViewController.swift
//  BBVK
//
//  Created by Saúl Pérez on 03/03/22.
//

import UIKit

class ContrasenaViewController: UIViewController {
    
    let bbvkUtilities = initializerUI()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    
    func initUI(){
        bbvkUtilities.MainViewController(viewControllerParam: view)
        
        
        let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "CONTRASEÑA")
        view.addSubview(arrowButton)
        arrowButton.addAnchors(left: 20, top: 85, right: nil , bottom: nil)
        
        let indicationsLabel = bbvkUtilities.uiLabelSetter(labelString: "Crea una contraseña segura", labelSize: 18, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(indicationsLabel)
        indicationsLabel.numberOfLines = 0
        indicationsLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
        
        let instructionsLabel = bbvkUtilities.uiLabelSetter(labelString: "La usarás  para entrar a la app y confirmar tus transacciones." + "\n \n" + "Usa al menos 6 caracteres alfanuméricos, no consecutivos ni repetidos.", labelSize: 15, textaligment: .left, isBold: false, isHighLighted: false)
        instructionsLabel.textColor = constants.grayfont
        view.addSubview(instructionsLabel)
        instructionsLabel.numberOfLines = 0
        instructionsLabel.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top, relativeToView: indicationsLabel)
        
        
        let understoodButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Crear Contraseña")
        view.addSubview(understoodButton)
        understoodButton.addAnchors(left: 30, top: nil, right: 30, bottom: 35)
       
        let firstNewPassLabel = bbvkUtilities.uiLabelSetter(labelString: "Contraseña", labelSize: 14, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(firstNewPassLabel)
        firstNewPassLabel.numberOfLines = 0
        firstNewPassLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: instructionsLabel)
        
        let firstNewPass = bbvkUtilities.textFieldSetter(isClear: false, placeHolderString: "", isSecure: true)
        view.addSubview(firstNewPass)
        firstNewPass.addAnchorsAndSize(width: nil, height: 40, left: 20, top: 5, right: 30, bottom: nil, withAnchor: .top, relativeToView: firstNewPassLabel)

        let eyeImage = UIImageView(image: UIImage(systemName: "eye"))
        firstNewPass.addSubview(eyeImage)
        eyeImage.addAnchors(left: nil, top: 10, right: 5, bottom: nil, withAnchor: nil, relativeToView: nil)
        eyeImage.tintColor = .black
        
        //segundo textfield
        let secondNewPassLabel = bbvkUtilities.uiLabelSetter(labelString: "Confirma tu contraseña ", labelSize: 14, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(secondNewPassLabel)
        secondNewPassLabel.numberOfLines = 0
        secondNewPassLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: firstNewPass)
        
        let secondNewPass = bbvkUtilities.textFieldSetter(isClear: false, placeHolderString: "", isSecure: true)
        view.addSubview(secondNewPass)
        secondNewPass.addAnchorsAndSize(width: nil, height: 40, left: 20, top: 5, right: 30, bottom: nil, withAnchor: .top, relativeToView: secondNewPassLabel)

        let eyeImage2 = UIImageView(image: UIImage(systemName: "eye"))
        secondNewPass.addSubview(eyeImage2)
        eyeImage2.addAnchors(left: nil, top: 10, right: 5, bottom: nil, withAnchor: nil, relativeToView: nil)
        eyeImage2.tintColor = .black
        
        
    }

}


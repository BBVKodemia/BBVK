//
//  NewContactViewController.swift
//  BBVK
//
//  Created by Saúl Pérez on 05/04/22.
//

import UIKit

class NewContactViewController: UIViewController {
    
    let bbvkUtilities = initializerUI()
    let constantes = constants()
    let contactsTV = UITableView()
    var contacts = [Contacts]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        initUI()

    }
    
    func initUI(){
        bbvkUtilities.MainViewController(viewControllerParam: view)
        
        
        let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: " AGREGAR CONTACTO")
        view.addSubview(arrowButton)
        arrowButton.addAnchors(left: 20, top: 85, right: nil , bottom: nil)
        arrowButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)

        
        let clabeLabel = bbvkUtilities.uiLabelSetter(labelString: "", labelSize: 15, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(clabeLabel)
        clabeLabel.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top, relativeToView: arrowButton)

        let tarjetaLabel = bbvkUtilities.uiLabelSetter(labelString: "", labelSize: 18, textaligment: .left, isBold: true, isHighLighted: true)
        view.addSubview(tarjetaLabel)
        tarjetaLabel.addAnchors(left: 90, top: 18, right: 20, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
        
        
        
        let understoodButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Agregar Contacto")
        view.addSubview(understoodButton)
        //understoodButton.addTarget(self, action: #selector(goAddFinalAction), for: .touchUpInside)
        understoodButton.addAnchors(left: 30, top: nil, right: 30, bottom: 35)
       
        let firstNewPassLabel = bbvkUtilities.uiLabelSetter(labelString: "Tarjeta 16 digitos", labelSize: 14, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(firstNewPassLabel)
        firstNewPassLabel.numberOfLines = 0
        firstNewPassLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: clabeLabel)
        
        let firstNewPass = bbvkUtilities.textFieldSetter(isClear: false, placeHolderString: "", isSecure: true)
        view.addSubview(firstNewPass)
        firstNewPass.addAnchorsAndSize(width: nil, height: 40, left: 20, top: 5, right: 30, bottom: nil, withAnchor: .top, relativeToView: firstNewPassLabel)

       
        
        //segundo textfield
        let institutionLabel = bbvkUtilities.uiLabelSetter(labelString: "Institución ", labelSize: 14, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(institutionLabel)
        institutionLabel.numberOfLines = 0
        institutionLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: firstNewPass)
        
        let institutionTextField = bbvkUtilities.textFieldSetter(isClear: false, placeHolderString: "", isSecure: true)
        view.addSubview(institutionTextField)
        institutionTextField.addAnchorsAndSize(width: nil, height: 40, left: 20, top: 5, right: 30, bottom: nil, withAnchor: .top, relativeToView: institutionLabel)
        
        
        let nameLabel = bbvkUtilities.uiLabelSetter(labelString: "Nombre", labelSize: 14, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(nameLabel)
        nameLabel.numberOfLines = 0
        nameLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: institutionTextField)
        
        let nameTextfield = bbvkUtilities.textFieldSetter(isClear: false, placeHolderString: "", isSecure: false)
        view.addSubview(nameTextfield)
        nameTextfield.addAnchorsAndSize(width: nil, height: 40, left: 20, top: 5, right: 30, bottom: nil, withAnchor: .top, relativeToView: nameLabel)

       
        
        // correo
        
        
        let emailLabel = bbvkUtilities.uiLabelSetter(labelString: "Correo de notificacion", labelSize: 14, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(emailLabel)
        emailLabel.numberOfLines = 0
        emailLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: nameTextfield)
        
        let emailTextfield = bbvkUtilities.textFieldSetter(isClear: false, placeHolderString: "", isSecure: false)
        view.addSubview(emailTextfield)
        emailTextfield.addAnchorsAndSize(width: nil, height: 40, left: 20, top: 5, right: 30, bottom: nil, withAnchor: .top, relativeToView: emailLabel)
        
        
    }
    

}

extension NewContactViewController{
   @objc func dismissView(){
      self.dismiss(animated: true, completion: nil)
   }
}

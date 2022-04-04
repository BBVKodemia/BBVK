//
//  DatosViewController.swift
//  BBVK
//
//  Created by Saúl Pérez on 22/03/22.
//

import UIKit

class DatosViewController: UIPageViewController {
    
    let bbvkUtilities = initializerUI()
    
    lazy var txtDatePicker: UITextField = {
        let txt = UITextField()
        
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = "Cumple"
        txt.font = UIFont.systemFont(ofSize: 20)
        txt.borderStyle = .roundedRect
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        txt.inputView = datePicker
        
        datePicker.addTarget(self, action: #selector(self.valuechanged), for: .valueChanged)
        
        return txt
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @objc func valuechanged(sender: UIDatePicker){
        let dateFormat =  DateFormatter()
        dateFormat.dateStyle = .long
        dateFormat.timeStyle = .none
        self.txtDatePicker.text = dateFormat.string(from: sender.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Main View"
        self.view.addSubview(self.txtDatePicker)
        //initUI()
        
        self.txtDatePicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:10).isActive = true
        self.txtDatePicker.trailingAnchor
        
    }
    
    func initUI(){
        bbvkUtilities.MainViewController(viewControllerParam: view)
        
        
        let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "INGRESA TUS DATOS")
        view.addSubview(arrowButton)
        arrowButton.addAnchors(left: 20, top: 85, right: nil , bottom: nil)
        
        let indicationsLabel = bbvkUtilities.uiLabelSetter(labelString: "Escríbelos tal como aparencen en tu identificación oficial, sin abreviaturas.", labelSize: 18, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(indicationsLabel)
        indicationsLabel.numberOfLines = 0
        indicationsLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
        
//        let instructionsLabel = bbvkUtilities.uiLabelSetter(labelString: "La usarás  para entrar a la app y confirmar tus transacciones." + "\n \n" + "Usa al menos 6 caracteres alfanuméricos, no consecutivos ni repetidos.", labelSize: 15, textaligment: .left, isBold: false, isHighLighted: false)
//        instructionsLabel.textColor = constants.grayfont
//        view.addSubview(instructionsLabel)
//        instructionsLabel.numberOfLines = 0
//        instructionsLabel.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top, relativeToView: indicationsLabel)
//
        
        let understoodButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Continuar")
        view.addSubview(understoodButton)
        understoodButton.addAnchors(left: 30, top: nil, right: 30, bottom: 35)
       
        let firstNewPassLabel = bbvkUtilities.uiLabelSetter(labelString: "Nombre(s)", labelSize: 14, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(firstNewPassLabel)
        firstNewPassLabel.numberOfLines = 0
        firstNewPassLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: indicationsLabel)
        
        let firstNewPass = bbvkUtilities.textFieldSetter(isClear: false, placeHolderString: "", isSecure: true)
        view.addSubview(firstNewPass)
        firstNewPass.addAnchorsAndSize(width: nil, height: 40, left: 20, top: 5, right: 30, bottom: nil, withAnchor: .top, relativeToView: firstNewPassLabel)

        
        //segundo textfield
        let secondNewPassLabel = bbvkUtilities.uiLabelSetter(labelString: "Apellido(s)", labelSize: 14, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(secondNewPassLabel)
        secondNewPassLabel.numberOfLines = 0
        secondNewPassLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: firstNewPass)
        
        let secondNewPass = bbvkUtilities.textFieldSetter(isClear: false, placeHolderString: "", isSecure: true)
        view.addSubview(secondNewPass)
        secondNewPass.addAnchorsAndSize(width: nil, height: 40, left: 20, top: 5, right: 30, bottom: nil, withAnchor: .top, relativeToView: secondNewPassLabel)

        
        //third textfield
        let occupationLabel = bbvkUtilities.uiLabelSetter(labelString: "Ocupacion", labelSize: 14, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(secondNewPassLabel)
        occupationLabel.numberOfLines = 0
        occupationLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: firstNewPass)
        
        let occupationTextField = bbvkUtilities.textFieldSetter(isClear: false, placeHolderString: "", isSecure: true)
        view.addSubview(occupationTextField)
        occupationTextField.addAnchorsAndSize(width: nil, height: 40, left: 20, top: 5, right: 30, bottom: nil, withAnchor: .top, relativeToView: secondNewPassLabel)

        

        
    }
    

    

}


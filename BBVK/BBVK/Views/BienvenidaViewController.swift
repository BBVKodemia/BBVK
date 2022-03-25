//
//  ViewController.swift
//  BBVK
//
//

import UIKit

class BienvenidaViewController: UIViewController {
    
    let utilities = initializerUI()
    let constantes = constants()
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
    }

    func initUI()
    {
        view.backgroundColor = .black
        let bankodemia = utilities.uiImageViewSetter(uiImageName: "bankodemia")
        view.addSubview(bankodemia)
        bankodemia.addAnchorsAndSize(width: 150, height: 60, left: 30, top: 30, right: 30, bottom: nil)
       
        
       
        
        let DatosLabel = utilities.uiLabelSetter(labelString: "¡Adios a las complicaciones! Usa el dinero a TU manera", labelSize: 24 ,textaligment:.center, isBold: true, isHighLighted: false)
        DatosLabel.textColor = UIColor.white
        DatosLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        DatosLabel.numberOfLines = 2
        view.addSubview(DatosLabel)
        DatosLabel.addAnchorsAndSize(width: nil, height: 80, left: 20, top: 120, right: 20, bottom: nil, withAnchor: nil, relativeToView: bankodemia)

        
        
        
        let iconoCelular = utilities.uiImageViewSetter(uiImageName: "iconoCelular")
        view.addSubview(iconoCelular)
        iconoCelular.addAnchorsAndSize(width: 200, height: 350, left: 50, top: height / 3, right: 50, bottom: 240, withAnchor: nil, relativeToView: DatosLabel)
       
        
        let accountCreateButton = utilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Crear Cuenta")
        view.addSubview(accountCreateButton)
        accountCreateButton.addAnchorsAndSize(width: 60, height: 40, left: 20, top: nil, right: 20, bottom: 120, withAnchor: .top, relativeToView: nil)
        
        
        let loginButton = utilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Iniciar Sesion")
        loginButton.addTarget(self, action: #selector(goCreateAccount), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.addAnchorsAndSize(width: 80, height: 40, left: 20, top: nil, right: 20, bottom: 50, withAnchor: .top, relativeToView: nil)
        

    
    }
    
    @objc func goCreateAccount(){
         print("Vamos por el menu!")
          let createAccount = CreateAccountViewController()
        createAccount.modalPresentationStyle = .fullScreen
        present(createAccount, animated: true, completion: {
           
        })
      }

    

}



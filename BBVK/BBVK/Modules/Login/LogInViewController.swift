//
//  ViewController.swift
//  BBVK
//
//  Created by Jonathan Avila Perez on 20/02/22.
//

import UIKit

class LogInViewController: UIViewController {
    
    let utilities = initializerUI()
    let constantes = constants()
    var loginConnectionManager = LoginConnectionManager()
    var emailTextfield = UITextField()
    var passwordTextfield = UITextField()
    var token2 = ""
    var loginManager = LoginManager()
    
    var signInButton : UIButton?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    initUI()
       
    }

    func initUI()
    {
 
        utilities.MainViewController(viewControllerParam: view)
       
       let arrowButton = utilities.ArrowButton(arrowBttnTxt: "Welcome")
       view.addSubview(arrowButton)
       arrowButton.addAnchors(left: 20, top: 85, right: nil , bottom: nil)
       arrowButton.addTarget(self, action: #selector(clickreturn), for: .touchUpInside)
//        let signInLabel = utilities.uiLabelSetter(labelString: "Iniciar Sesion", labelSize: 14 ,textaligment:.left, isBold: true, isHighLighted: false)
//        view.addSubview(signInLabel)
//        signInLabel.addAnchorsAndSize(width: nil, height: 50, left: 20, top: 70, right: 20, bottom: nil, withAnchor: nil, relativeToView: nil)
        
        let solicitudDatosLabel = utilities.uiLabelSetter(labelString: "Escribe el correo y telefono con el que te registraste, a través de estos te enviaremos el acceso", labelSize: 16 ,textaligment:.left, isBold: true, isHighLighted: false)
        solicitudDatosLabel.numberOfLines = 3
        view.addSubview(solicitudDatosLabel)
        solicitudDatosLabel.addAnchorsAndSize(width: nil, height: 80, left: 20, top: 120, right: 20, bottom: nil, withAnchor: nil, relativeToView: arrowButton)
        
        
        let emailLabel = utilities.uiLabelSetter(labelString: "Escribe tu correo", labelSize: 14 ,textaligment:.left, isBold: true, isHighLighted: false)
        view.addSubview(emailLabel)
        emailLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: solicitudDatosLabel)
         
       emailTextfield = utilities.textFieldSetter(isClear: false, placeHolderString: "  example@bbvk.com", isSecure: false)
        
        view.addSubview(emailTextfield)
        emailTextfield.addAnchorsAndSize(width: nil, height: 40, left: 20, top: 5, right: 20, bottom: nil, withAnchor: .top, relativeToView: emailLabel)
        
         let passwordLabel = utilities.uiLabelSetter(labelString: "Escribe tu contraseña", labelSize: 14 ,textaligment:.left, isBold: true, isHighLighted: false)
        view.addSubview(passwordLabel)
        passwordLabel.addAnchors(left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: emailTextfield)
        
         passwordTextfield = utilities.textFieldSetter(isClear: false, placeHolderString: "  ********", isSecure: true)
        
        view.addSubview(passwordTextfield)
        passwordTextfield.addAnchorsAndSize(width: nil, height: 40, left: 20, top: 5, right: 20, bottom: nil, withAnchor: .top, relativeToView: passwordLabel)
        
        let helpLabel = utilities.uiLabelSetter(labelString: "¿Necesitas ayuda? Escribenos a ", labelSize: 14, textaligment: .center, isBold: false, isHighLighted: false)
        view.addSubview(helpLabel)
        helpLabel.addAnchorsAndSize(width: nil, height: 20, left: 20, top: nil, right: 20, bottom: 120, withAnchor: .top, relativeToView: passwordTextfield)
       
        let bankodemiaLabel = utilities.uiLabelSetter(labelString: "bankodemia@com.mx ", labelSize: 14, textaligment: .center, isBold: false, isHighLighted: false)
        view.addSubview(bankodemiaLabel)
        bankodemiaLabel.addAnchorsAndSize(width: nil, height: 20, left: 20, top: nil, right: 20, bottom: 100, withAnchor: .top, relativeToView: helpLabel)
        
               
        let miboton = utilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Iniciar Sesion")

        miboton.addTarget(self, action: #selector(clickLogIn), for: .touchUpInside)
        view.addSubview(miboton)
        
       miboton.addAnchorsAndSize(width: 60, height: 40, left: 20, top: nil, right: 20, bottom: 50, withAnchor: .top, relativeToView: bankodemiaLabel)
        
}
    
    @objc func clickLogIn(){
       let homeVC = HomeViewController()

        loginConnectionManager.login(email: emailTextfield.text!, password: passwordTextfield.text!) { token in
            guard let token = token else {
                return
            }
            print("Token: \(token)")
            self.token2 = token
        }
        loginManager.setTandomCardGeneratons()
        

      homeVC.modalPresentationStyle = .fullScreen
      present(homeVC, animated: true, completion: nil)
      }
   
   @objc func clickreturn() {
       
       self.dismiss(animated: true, completion: nil)
   
}

    
    
    

}



//
//  CreateAccountViewController.swift
//  BBVK
//
//  Created by user209759 on 3/15/22.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    let utilities = initializerUI()
    let constantes = constants()
    
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initUI()
    }
    
    
    func initUI()
    {
        
        view.backgroundColor = .white
        utilities.MainViewController(viewControllerParam: view)        //let bankodemia = utilities.uiImageViewSetter(uiImageName: "headerimage")
        //view.addSubview(bankodemia)
        //bankodemia.addAnchorsAndSize(width: 50, height: 60, left: 30, top: 30, right: 30, bottom: nil)
        
        let accountImage = utilities.uiImageViewSetter(uiImageName: "accountImage")
        view.addSubview(accountImage)
        accountImage.addAnchorsAndSize(width: 200, height: 350, left: 50, top: height / 3, right: 50, bottom: 240, withAnchor: nil, relativeToView: accountImage)
        
        
        
        let goToStartButton = utilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Volver a inicio")
        view.addSubview(goToStartButton)
        goToStartButton.addAnchorsAndSize(width: 80, height: 40, left: 20, top: nil, right: 20, bottom: 50, withAnchor: .top, relativeToView: nil)
    }
        
    

}

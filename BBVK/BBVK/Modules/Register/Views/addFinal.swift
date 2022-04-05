//
//  ViewController.swift
//  proyecyoginal
//
//  Created by user209759 on 3/30/22.
//
//
//

import UIKit

class AddFinalViewController: UIViewController {
    
    let bbvkUtilities = initializerUI()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    
    func initUI(){
        bbvkUtilities.MainViewController(viewControllerParam: view)
        
        
        
        
        let imageContact = bbvkUtilities.uiImageViewSetter(uiImageName: "users")
        view.addSubview(imageContact)
        imageContact.addAnchors(left: 30, top: height / 2 - 70, right: 30, bottom: nil)
       
        let addLabel = bbvkUtilities.uiLabelSetter(labelString: "Tu contacto fue agregado con éxito", labelSize: 20, textaligment: .center, isBold: false, isHighLighted: false)
        view.addSubview(addLabel)
         addLabel.addAnchorsAndSize(width: width, height: 40, left: 30, top: 10, right: 30, bottom: nil, withAnchor: .top, relativeToView: imageContact)
        
       
        
        
        
       
        let goBackButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Volver a inicio")
        view.addSubview(goBackButton)
        goBackButton.addTarget(self, action: #selector(goAddFinalAction), for: .touchUpInside)
        goBackButton.addAnchors(left: 30, top: nil, right: 30, bottom: 35)
       
       
        
    }
    
    
    
    @objc func goAddFinalAction(){
      
        
        
//        let next = SignInViewController()
//        next.modalPresentationStyle = .fullScreen
//        present(next, animated: true, completion: nil)
   
    }


}




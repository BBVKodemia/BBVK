//
//  VerificacionIdentidadWelcome.swift
//  BBVK
//
//  Created by Jonathan Avila on 26/02/22.
//

import Foundation
import UIKit

class UploadDocumentViewController: UIViewController{
   let bbvkUtilities = initializerUI()
    var arrowBttntxt = String()
    var documentsView =  UIView()
   
   override func  viewDidLoad() {
      super.viewDidLoad()
      bbvkUtilities.MainViewController(viewControllerParam: self.view)
       initUi ()
      
   }
    
    init(arrowBttntct: String) {
        self.arrowBttntxt = arrowBttntct
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUi (){
        
        // Arrow Button
        let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: arrowBttntxt)
        view.addSubview(arrowButton)
        arrowButton.addAnchors(left: 20, top: 85, right: nil , bottom: nil)
       arrowButton.addTarget(self, action: #selector(ineclickreturn), for: .touchUpInside)
        
        let indicationsLabel = bbvkUtilities.uiLabelSetter(labelString: "Dale permiso a Bankodemia para utilizar la camara, Asegurate de tener buena luz y enfocar bien tu documento de frente", labelSize: 15, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(indicationsLabel)
        indicationsLabel.numberOfLines = 0
        indicationsLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
        
        
        documentsView.layer.cornerRadius = 20
        documentsView.layer.borderWidth = 2
        documentsView.backgroundColor = .white
        documentsView.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(documentsView)
        documentsView.addAnchorsAndSize(width: width/4, height: height/4, left: 20, top: 40, right: 20, bottom: nil,withAnchor: .top,relativeToView: indicationsLabel)
        
        let indicationsLabelvc = bbvkUtilities.uiLabelSetter(labelString: "Arrastra tu archivo aqui o subelo desde tu ORDENADOR", labelSize: 15, textaligment: .center, isBold: true, isHighLighted: false)
        documentsView.addSubview(indicationsLabelvc)
        indicationsLabelvc.numberOfLines = 0
        indicationsLabelvc.addAnchorsCenterAndFillContainerWithSize()
        

        
        let ineButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Subir Informacion")
        view.addSubview(ineButton)
        ineButton.addAnchors(left: 40, top: nil, right: 40, bottom: 80)
        ineButton.addTarget(self, action: #selector(ineclickreturn), for: .touchUpInside)
        
        
        
        
    }
   
}

extension UploadDocumentViewController {

    @objc func ineclickreturn() {
        
        let passwordVC = PasswordViewControllers()
       passwordVC.modalPresentationStyle = .fullScreen
       present(passwordVC, animated: true, completion: nil)
    
}
}

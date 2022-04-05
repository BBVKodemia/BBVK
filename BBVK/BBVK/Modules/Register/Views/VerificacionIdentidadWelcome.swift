//
//  VerificacionIdentidadWelcome.swift
//  BBVK
//
//  Created by Jonathan Avila on 26/02/22.
//

import Foundation
import UIKit

class verificacionIdentidadWelcome: UIViewController{
   let bbvkUtilities = initializerUI()
    let userModel = UserModel()
    var registerManager : RegisterManager?
   
   override func  viewDidLoad() {
      super.viewDidLoad()
      bbvkUtilities.MainViewController(viewControllerParam: self.view)
       initUi ()
      
   }
    
    func initUi (){
        
        // Arrow Button
        let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "PHONE NUMBER")
        view.addSubview(arrowButton)
        arrowButton.addAnchors(left: 20, top: 85, right: nil , bottom: nil)
        
        let indicationsLabel = bbvkUtilities.uiLabelSetter(labelString: "Select a document to verify your identity", labelSize: 18, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(indicationsLabel)
        indicationsLabel.numberOfLines = 0
        indicationsLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
        
        let ineButton = bbvkUtilities.uiButtonSetter(ispurple: true, isgray: false, isgreen: false, buttonText: "INE")
        view.addSubview(ineButton)
        ineButton.addAnchors(left: 40, top: 80, right: 40, bottom: nil, withAnchor: .top, relativeToView: indicationsLabel)
        ineButton.addTarget(self, action: #selector(ineclick), for: .touchUpInside)
        
        let docMicBtn = bbvkUtilities.uiButtonSetter(ispurple: true, isgray: false, isgreen: false, buttonText: "Immigration Document")
        view.addSubview(docMicBtn)
        docMicBtn.addAnchors(left: 40, top: 30, right: 40, bottom: nil, withAnchor: .top, relativeToView: ineButton)
        docMicBtn.addTarget(self, action: #selector(docMicBtnclick), for: .touchUpInside)
        
        let passportBtn = bbvkUtilities.uiButtonSetter(ispurple: true, isgray: false, isgreen: false, buttonText: "Passport")
        view.addSubview(passportBtn)
        passportBtn.addAnchors(left: 40, top: 30, right: 40, bottom: nil, withAnchor: .top, relativeToView: docMicBtn)
        passportBtn.addTarget(self, action: #selector(passportBtnclick), for: .touchUpInside)
        
        //footer 1 with link
        let footerLabel1 = bbvkUtilities.uiLabelSetter(labelString: "Want to know", labelSize: 14, textaligment: .left, isBold: false, isHighLighted: false)
        view.addSubview(footerLabel1)
        footerLabel1.addAnchors(left: constants.width/10, top: nil, right: nil, bottom: (constants.height/10))
        //footer 2 with link
        let footerLabel2 = bbvkUtilities.uiLabelSetter(labelString: "how we protect your information?", labelSize: 14, textaligment: .left, isBold: false, isHighLighted: true)
        view.addSubview(footerLabel2)
        footerLabel2.addAnchors(left: 10, top: nil, right: nil, bottom: (constants.height/10) , withAnchor: .left, relativeToView: footerLabel1)
        
        
    }
   
}

extension verificacionIdentidadWelcome {

    @objc func ineclick() {
        registerManager!.userModel.useridentityImageType = "INE"
        let ineClickVc = UploadDocumentViewController(arrowBttntct: "INE")
        ineClickVc.registerManager = self.registerManager
        ineClickVc.modalPresentationStyle = .fullScreen
        self.present(ineClickVc, animated: true, completion: nil)
        
    }
    
    @objc func docMicBtnclick() {
        registerManager!.userModel.useridentityImageType = "MIGRATION_FORM"
        let docMicBtnclickVc = UploadDocumentViewController(arrowBttntct: "Immigrant Document")
        docMicBtnclickVc.registerManager = self.registerManager
        docMicBtnclickVc.modalPresentationStyle = .fullScreen
        self.present(docMicBtnclickVc, animated: true, completion: nil)
        
    }
    
    @objc func passportBtnclick() {
        registerManager!.userModel.useridentityImageType = "PASSPORT"
        let passportBtnclickVc = UploadDocumentViewController(arrowBttntct: "Passport")
        passportBtnclickVc.registerManager = self.registerManager
        passportBtnclickVc.modalPresentationStyle = .fullScreen
        self.present(passportBtnclickVc, animated: true, completion: nil)
        
    }
    
}

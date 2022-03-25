//
//  LoadingViewController.swift
//  BBVK
//
//  Created by Jonathan Avila on 22/03/22.
//

import Foundation
import UIKit

class LoadingViewController: UIViewController{
   let bbvkUtilities = initializerUI()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      initUI()
   }
   
   func initUI (){
      //Logo
      view.backgroundColor = .white
      let loadingLogo = UIImageView(image: UIImage(named: "LoadingPNG"))
      view.addSubview(loadingLogo)
      loadingLogo.addAnchorsAndSize(width: nil, height: nil, left: 80, top:(constants.height/8)*2.5 , right: 80, bottom: nil)
      
      let waitingLabel = bbvkUtilities.uiLabelSetter(labelString: "Espera un momento, estamos enviando tus datos", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
      waitingLabel.numberOfLines = 0
      view.addSubview(waitingLabel)
      
      waitingLabel.addAnchors(left: 20, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView: loadingLogo)
      
      // Crear Password button
      let createPassword = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "next view")
      view.addSubview(createPassword)
      createPassword.addAnchorsAndSize(width: nil, height: width/10, left: 20, top: nil, right: 20, bottom: 40)
      createPassword.addTarget(self, action: #selector(DisplayLoadingVC), for: .touchUpInside)
      
      
   }
   
}

extension LoadingViewController{
   @objc func DisplayLoadingVC(){
      let loadingVC = ThankYouViewController()
      loadingVC.modalPresentationStyle = .fullScreen
      self.present(loadingVC, animated: true, completion: nil)
      
   }
   
}

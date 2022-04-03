//
//  ThankYouViewController.swift
//  BBVK
//
//  Created by Jonathan Avila on 22/03/22.
//

import Foundation
import UIKit

class ThankYouViewController: UIViewController{
   let bbvkUtilities = initializerUI()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      initUI()
   }
   
   func initUI (){
      //Logo
      view.backgroundColor = .white
      let loadingLogo = UIImageView(image: UIImage(named: "airplane"))
      view.addSubview(loadingLogo)
      loadingLogo.addAnchorsAndSize(width: nil, height: nil, left: 80, top:(constants.height/8)*2.1 , right: 80, bottom: nil)
      
      let waitingLabel = bbvkUtilities.uiLabelSetter(labelString: "!Listo! Recibimos tu informacion. Usualmente tardamos unos minutos en verificar, pero en caso de tener algun problema, nos comunicaremos contigo.", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
      waitingLabel.numberOfLines = 0
      view.addSubview(waitingLabel)
      
      waitingLabel.addAnchors(left: 20, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView: loadingLogo)
      
      
      let thankYouLabel = bbvkUtilities.uiLabelSetter(labelString: "Gracias por usar BBVK", labelSize: 15, textaligment: .center, isBold: true, isHighLighted: true)
      thankYouLabel.numberOfLines = 0
      view.addSubview(thankYouLabel)
      
      thankYouLabel.addAnchors(left: 20, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView: waitingLabel)
      
      // Crear backToBegining button
      let backToHome = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Volver al Inicio")
      view.addSubview(backToHome)
      backToHome.addAnchorsAndSize(width: nil, height: width/10, left: 20, top: nil, right: 20, bottom: 40)
      backToHome.addTarget(self, action: #selector(DisplayLoadingVC), for: .touchUpInside)
      
      
   }
   
}

extension ThankYouViewController{
   @objc func DisplayLoadingVC(){
      self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
   }
   
}




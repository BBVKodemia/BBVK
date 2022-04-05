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
    let registerManager = RegisterManager()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      initUI()
       
   }
   
   func initUI (){
      //Logo
      view.backgroundColor = .white
      let loadingLogo = UIImageView(image: UIImage(named: "LoadingPNG"))
      view.addSubview(loadingLogo)
      loadingLogo.addAnchorsAndSize(width: nil, height: nil, left: 90, top:(constants.height/8)*2.5 , right: 90, bottom: nil)
      
      let waitingLabel = bbvkUtilities.uiLabelSetter(labelString: "Espera un momento, estamos enviando tus datos", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
      waitingLabel.numberOfLines = 0
      view.addSubview(waitingLabel)
      
      waitingLabel.addAnchors(left: 20, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView: loadingLogo)
       

       print(registerManager.userModel.occupation)
       print(registerManager.userModel.useridentityImageType)
       print(registerManager.userModel.userSpecialWord)
//       print(userModel.userIdentytyImage)
       print(registerManager.userModel.userName)
       print(registerManager.userModel.userLastNAme)
       print(registerManager.userModel.userPhone)
       print(registerManager.userModel.userBirthDate)
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
         
         let loadingVC = ThankYouViewController()
         loadingVC.modalPresentationStyle = .fullScreen
         self.present(loadingVC, animated: true, completion: nil)
      }
   }
   
}

extension LoadingViewController{
   @objc func DisplayLoadingVC(){
     
      
   }
   
}

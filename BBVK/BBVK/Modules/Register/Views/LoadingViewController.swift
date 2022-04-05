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
    var registerManager : RegisterManager?
    var conectionManager = ConnectionManager()
   
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
       conectionManager.userModelInfo = registerManager?.userModel
       let responseString = self.conectionManager.postRegister()
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
          
          if responseString.contains("success"){
         let loadingVC = ThankYouViewController()
         loadingVC.modalPresentationStyle = .fullScreen
         self.present(loadingVC, animated: true, completion: nil)
          }else {
              let alert = self.bbvkUtilities.alertDismissViewSetter(tittle: "Something went Wrong ", message: "Please try again later")
              let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                  UIAlertAction in
                  self.dismissLoadingVC()
              }
              alert.addAction(okAction)
              self.present(alert, animated: true, completion: {})

          }
      }
   }
   
}

extension LoadingViewController{
   @objc func dismissLoadingVC(){
       self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
      
   }
   
}

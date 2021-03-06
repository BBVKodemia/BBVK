//
//  LoadingViewController.swift
//  BBVK
//
//  Created by Jonathan Avila on 22/03/22.
//

import Foundation
import UIKit

class LoadingProcessingViewController: UIViewController{
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
      
      let waitingLabel = bbvkUtilities.uiLabelSetter(labelString: "Espera un momento, estamos procesando tu transaccion", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
      waitingLabel.numberOfLines = 0
      view.addSubview(waitingLabel)
      
      waitingLabel.addAnchors(left: 20, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView: loadingLogo)
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
         
         let loadingVC = TransactionCompletedViewController()
         loadingVC.modalPresentationStyle = .fullScreen
         self.present(loadingVC, animated: true, completion: nil)
      }
   }
   
}

extension LoadingProcessingViewController{
   @objc func DisplayLoadingVC(){
     
      
   }
   
}

//
//  LoadingViewController.swift
//  BBVK
//
//  Created by Jonathan Avila on 22/03/22.
//

import Foundation
import UIKit

class TransactionCompletedViewController: UIViewController{
   let bbvkUtilities = initializerUI()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      initUI()
   }
   
   func initUI (){
      //Logo
      view.backgroundColor = .white
      let loadingLogo = UIImageView(image: UIImage(named: "completedTransaction"))
      view.addSubview(loadingLogo)
      loadingLogo.addAnchorsAndSize(width: nil, height: nil, left: 80, top:(constants.height/8)*2.5 , right: 80, bottom: nil)
      
      let waitingLabel = bbvkUtilities.uiLabelSetter(labelString: "Your Transaction was completed", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
      waitingLabel.numberOfLines = 0
      view.addSubview(waitingLabel)
      
      waitingLabel.addAnchors(left: 20, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView: loadingLogo)
      
      let understoodButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "volver al inicio")
             view.addSubview(understoodButton)
             understoodButton.addAnchors(left: 30, top: nil, right: 30, bottom: 35)
      
      understoodButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
   
   }
   
}

extension TransactionCompletedViewController{
   @objc func dismissView(){
      self.dismiss(animated: true, completion: nil)
   }
   
}

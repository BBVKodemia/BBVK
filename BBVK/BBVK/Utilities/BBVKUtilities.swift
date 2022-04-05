import UIKit
import Foundation

class initializerUI{
    var stringPlaceHolder: UITextField?
    var placeHolder: NSAttributedString?

    var uiImage: UIImageView?
    var uiLabel: UILabel?
    var uiButton: UIButton?
    var profileButton: UIButton?
    var questionButton: UIButton?
    var uiView: UIView?
    var alert: UIAlertController?
    
    
    
    //MARK: creation of images
     func uiImageViewSetter ( uiImageName: String) -> UIImageView{
        uiImage = UIImageView()
        uiImage?.image = UIImage(named: uiImageName)
        
        return uiImage!
    }
    
    //MARK: creation of labels
     func uiLabelSetter ( labelString: String, labelSize: CGFloat,  textaligment: NSTextAlignment,  isBold: Bool, isHighLighted: Bool) -> UILabel{
        uiLabel = UILabel()
        uiLabel?.font = UIFont(name: "HelveticaNeue", size: labelSize)
        if isBold == true {
            uiLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: labelSize)
        }
        if isHighLighted == true {
           uiLabel?.highlightedTextColor = constants.textColorHighligthed
            uiLabel?.isHighlighted = true
        }
        
        uiLabel?.text = labelString
        uiLabel?.textColor = .black
        uiLabel?.textAlignment = textaligment
        
        return uiLabel!
    }
    
    //MARK: creation of placeHolders
     func textFieldSetter( isClear: Bool, placeHolderString: String, isSecure: Bool) -> UITextField {
        
        stringPlaceHolder = UITextField()
        stringPlaceHolder?.textColor = .black
        if isClear != true {
            stringPlaceHolder?.backgroundColor = .white
            stringPlaceHolder?.layer.borderWidth = 1
            stringPlaceHolder?.layer.cornerRadius = constants.cornerTextField
        }
        
        if isSecure == true{
            stringPlaceHolder?.isSecureTextEntry = true
        }
        
        stringPlaceHolder?.attributedPlaceholder = NSAttributedString(string: placeHolderString ,
                                                                      attributes: [NSAttributedString.Key.foregroundColor: constants.placeHolderColor])
        return stringPlaceHolder!
    }
    
    
    //MARK: creation of buttons
    
   func uiButtonSetter(ispurple:Bool, isgray:Bool, isgreen: Bool, buttonText: String) -> UIButton{
        
      uiButton = UIButton()
      uiButton?.layer.cornerRadius = 5
      uiButton?.titleLabel?.font = constants.normalFont
      uiButton?.setTitle(buttonText, for: .normal)

        
        if ispurple == true {
           uiButton?.backgroundColor = constants.backgroundButtoncolorpurple
           uiButton?.setTitleColor(.white, for: .normal)
        }
        
      if isgray == true {
         uiButton?.backgroundColor = constants.backgroundButtoncolorgray
         uiButton?.setTitleColor(.white, for: .normal)
      }
        
      if isgreen == true {
         uiButton?.backgroundColor = constants.backgroundButtoncolorGreen
         uiButton?.setTitleColor(.white, for: .normal)
      }
        
        
        return uiButton!
    }
   
   func uiButtonSetterClear(ispurple:Bool, isgreen: Bool, buttonText: String) -> UIButton{
        
      uiButton = UIButton()
      uiButton?.layer.cornerRadius = 5
      uiButton?.titleLabel?.font = constants.normalFont
      uiButton?.setTitle(buttonText, for: .normal)
      uiButton?.setTitleColor(.black, for: .normal)
        
        if ispurple == true {
           uiButton?.backgroundColor = .clear
           uiButton?.setTitleColor(.white, for: .normal)
            uiButton?.layer.borderColor = constants.backgroundButtoncolorgray.cgColor
        }
        
      if isgreen == true {
         uiButton?.backgroundColor = .clear
         uiButton?.setTitleColor(.white, for: .normal)
          uiButton?.layer.borderColor = constants.backgroundButtoncolorGreen.cgColor
      }
        
        
        return uiButton!
    }
    
    
    //MARK: Alert creation
    
    func alertViewSetter(tittle: String, message: String, buttontittle: String?) -> UIAlertController{
        
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: buttontittle, style: UIAlertAction.Style.default, handler: nil))
        
        return alert
    }
    
    func alertDismissViewSetter(tittle: String, message: String) -> UIAlertController{
        
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: UIAlertController.Style.alert)
        
        return alert
    }
   
   func MainViewController(viewControllerParam: UIView) {
      let headerImage: UIImageView?
      viewControllerParam.backgroundColor = constants.whiteBackground
      //MARK: Header
      headerImage = uiImageViewSetter(uiImageName: "headerimage")
      viewControllerParam.addSubview(headerImage!)
      headerImage?.addAnchorsAndSize(width: 70, height: 40, left: (constants.width/2)-35, top: 40, right: nil, bottom: nil)
   }
   
   func HomeViewController(viewControllerParam: UIView) {
      let headerImage: UIImageView?
      viewControllerParam.backgroundColor = constants.whiteBackground
      //MARK: Header
      headerImage = uiImageViewSetter(uiImageName: "headerimage")
      viewControllerParam.addSubview(headerImage!)
      headerImage?.addAnchorsAndSize(width: 70, height: 40, left: (constants.width/2)-35, top: 55, right: nil, bottom: nil)
      
      
      profileButton = UIButton()
      let profileIcon = UIImage(systemName: "person.crop.circle")
      profileButton?.setImage(profileIcon, for: .normal)
      profileButton?.backgroundColor = .clear
      profileButton?.tintColor = .black
      profileButton?.contentHorizontalAlignment = .fill
      profileButton?.contentVerticalAlignment = .fill
      
      viewControllerParam.addSubview(profileButton!)
      profileButton?.addAnchorsAndSize(width: 35, height: 35, left: 30, top: 55, right: nil, bottom: nil)
      
      
      questionButton = UIButton()
      questionButton?.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
      questionButton?.backgroundColor = .clear
      questionButton?.tintColor = .black
      questionButton?.contentHorizontalAlignment = .fill
      questionButton?.contentVerticalAlignment = .fill
      
      viewControllerParam.addSubview(questionButton!)
      questionButton?.addAnchorsAndSize(width: 35, height: 35, left: nil, top: 55, right: 30, bottom: nil)
   }
   
   func ArrowButton(arrowBttnTxt: String) -> UIButton {
      
      uiButton = UIButton()
      uiButton?.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
      uiButton?.titleLabel?.font = UIFont(name: "Poppins", size: 20)
      uiButton?.backgroundColor = .clear
      uiButton?.setTitle("  \(arrowBttnTxt)", for: .normal)
      uiButton?.setTitleColor(constants.grayfont, for: .normal)
      uiButton?.tintColor = .black
      return uiButton!
   }

    
    
    
    
}



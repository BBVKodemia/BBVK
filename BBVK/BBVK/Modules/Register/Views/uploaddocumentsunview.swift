//
//  VerificacionIdentidadWelcome.swift
//  BBVK
//
//  Created by Jonathan Avila on 26/02/22.
//

import Foundation
import UIKit
import MobileCoreServices

class UploadDocumentViewController: UIViewController{
    let bbvkUtilities = initializerUI()
    var arrowBttntxt = String()
    var fileNameString = ""
    var documentsView =  UIView()
    let vc = UIImagePickerController()
    var imageLabel = UILabel()
    var image64String = ""
    var uploadedImage = UIImage()
    var registerManager : RegisterManager?
    
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        bbvkUtilities.MainViewController(viewControllerParam: self.view)
        initUi ()
        vc.delegate = self
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
        arrowButton.addTarget(self, action: #selector(dismissReturn), for: .touchUpInside)
        
        let indicationsLabel = bbvkUtilities.uiLabelSetter(labelString: "Dale permiso a Bankodemia para utilizar la camara, Asegurate de tener buena luz y enfocar bien tu documento de frente", labelSize: 15, textaligment: .left, isBold: true, isHighLighted: false)
        view.addSubview(indicationsLabel)
        indicationsLabel.numberOfLines = 0
        indicationsLabel.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
        
        
        documentsView.layer.cornerRadius = 20
        documentsView.layer.borderWidth = 2
        documentsView.backgroundColor = .white
        documentsView.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(documentsView)
        documentsView.addAnchorsAndSize(width: width/4, height: (height/4), left: 20, top: 80, right: 20, bottom: nil,withAnchor: .top,relativeToView: indicationsLabel)
        
        let indicationsLabelvc = bbvkUtilities.uiButtonSetter(ispurple: true, isgray: false, isgreen: false, buttonText: "Click here to upload your document")
        documentsView.addSubview(indicationsLabelvc)
        indicationsLabelvc.addAnchorsAndSize(width: width/3 , height: (height/20)*2, left: 10, top: 15, right: 10, bottom: nil)
        indicationsLabelvc.addTarget(self, action: #selector(uploadFunc), for: .touchUpInside)
        
        let indicationsLabelvc2 = bbvkUtilities.uiButtonSetter(ispurple: true, isgray: false, isgreen: false, buttonText: "Click here to open your camera")
        documentsView.addSubview(indicationsLabelvc2)
        indicationsLabelvc2.addAnchorsAndSize(width: width/3 , height: (height/20)*2, left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: indicationsLabelvc)
        indicationsLabelvc2.addTarget(self, action: #selector(cameraFunc), for: .touchUpInside)
        
        
        imageLabel = bbvkUtilities.uiLabelSetter(labelString: "Waiting for document...", labelSize: 20, textaligment: .center, isBold: false, isHighLighted: true)
        documentsView.addSubview(imageLabel)
        imageLabel.addAnchors(left: 20, top: 40, right: 20, bottom: nil, withAnchor: .top, relativeToView: indicationsLabelvc2)
        
        
        
        let ineButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: "Upload Information")
        view.addSubview(ineButton)
        ineButton.addAnchors(left: 40, top: nil, right: 40, bottom: 80)
        ineButton.addTarget(self, action: #selector(passwordView), for: .touchUpInside)
        
        
        
        
    }
    
}

extension UploadDocumentViewController {
    
    @objc func dismissReturn() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc func passwordView() {

        image64String = convertImageToBase64String(img: uploadedImage)
        let validation = registerManager!.validateImage(imageText: image64String)
        if  validation == true  {
            let passwordVC = PasswordViewControllers()
            passwordVC.registerManager = self.registerManager
            passwordVC.modalPresentationStyle = .fullScreen
            present(passwordVC, animated: true, completion: nil)
        }else{
            let alert = bbvkUtilities.alertViewSetter(tittle: "Something went Wrong with the image", message: "Please upload another document", buttontittle: "ok")
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
}

extension UploadDocumentViewController:UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @objc func cameraFunc() {
        vc.sourceType = .camera
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @objc func uploadFunc() {
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        present(vc, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        imageLabel.text = "Photo uploaded"
        uploadedImage = image
    }
    
    
    func convertImageToBase64String (img: UIImage) -> String {
        return img.jpegData(compressionQuality: 0.0)?.base64EncodedString() ?? ""
    }
}

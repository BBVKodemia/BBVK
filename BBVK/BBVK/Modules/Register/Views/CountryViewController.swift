//
//  CountryViewController.swift
//  BBVK
//
//  Created by Saúl Pérez on 01/04/22.
//

import UIKit

class CountryViewController: UIViewController {
    let phoneTextField = UITextField()
    let codeCountryTextField = UITextField()
    let continueButton = UIButton()
    let tableView = UITableView()
    let bbvkUtilities = initializerUI()
    var registerManager: RegisterManager?


    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addDoneButtonOnKeyboard()
    }
    
    private func setupView() {
        bbvkUtilities.MainViewController(viewControllerParam: view)
        let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "Personal Information")
        view.addSubview(arrowButton)
        arrowButton.addAnchors(left: 20, top: 85, right: nil , bottom: nil)
        arrowButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        view.backgroundColor = UIColor.systemBackground
        
        let instructionsLabel = bbvkUtilities.uiLabelSetter(labelString: "Please fill below form with your phone number", labelSize: 18, textaligment: .center, isBold: false, isHighLighted: false)
        view.addSubview(instructionsLabel)
        instructionsLabel.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
        
        view.addSubview(codeCountryTextField)
        codeCountryTextField.addAnchorsAndSize(width: 60, height: nil, left: 20, top: 40, right: nil, bottom: nil, withAnchor: .top, relativeToView: instructionsLabel)
        codeCountryTextField.placeholder = "+ 52"
        codeCountryTextField.borderStyle = .roundedRect
        codeCountryTextField.text = "+52"
        
        
        view.addSubview(phoneTextField)
        phoneTextField.addAnchors(left: nil, top: 40, right: nil, bottom: nil, withAnchor: .top, relativeToView: instructionsLabel)
        phoneTextField.addAnchors(left: 5, top: nil, right: 20, bottom: nil, withAnchor: .left, relativeToView: codeCountryTextField)
        phoneTextField.placeholder = "Your phone number"
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.maxLength = 10
        
        view.addSubview(continueButton)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                   constant: -20),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        continueButton.backgroundColor = constants.backgroundButtoncolorGreen
        continueButton.clipsToBounds = true
        continueButton.layer.masksToBounds = true
        continueButton.layer.cornerRadius = 8
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.setTitle("Continuar", for: .normal)
        continueButton.addTarget(self,
                                 action: #selector(continueFlow),
                                 for: .touchUpInside)
        
        codeCountryTextField.delegate = self
        phoneTextField.delegate = self
        phoneTextField.keyboardType = .numberPad
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: codeCountryTextField.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CodeTableVewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
        tableView.clipsToBounds = true
        tableView.layer.masksToBounds = true
        tableView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        tableView.layer.borderWidth = 1
        tableView.layer.cornerRadius = 4
    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        phoneTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        phoneTextField.resignFirstResponder()
    }
    
    @objc func continueFlow() {
       let verificacionVC = verificacionIdentidadWelcome()
        verificacionVC.registerManager = self.registerManager
        if registerManager!.validatingPhone(lada: codeCountryTextField.text!, phone: phoneTextField.text!) == false{
            let alert = bbvkUtilities.alertViewSetter(tittle: "Some fields are empty", message: "Please fill all the fields in order to proceed", buttontittle: "ok")
                     self.present(alert, animated: true, completion: nil)
        }else{
       verificacionVC.modalPresentationStyle = .fullScreen
       present(verificacionVC, animated: true, completion: nil)
        }
    }
}

extension CountryViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == codeCountryTextField {
            tableView.isHidden = false
            view.endEditing(true)
            return false
        } else {
            tableView.isHidden = true
            return true
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneTextField {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
}


extension CountryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CodeTableVewCell else {
            return UITableViewCell()
        }
        cell.textCodeLabel.text = CountryDictionary[indexPath.item]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CountryDictionary.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        codeCountryTextField.text = String(CountryDictionary[indexPath.item].split(separator: " ").first ?? "")
        tableView.isHidden = true
    }
    
    @objc func dismissView() {
       self.dismiss(animated: true, completion: nil)
    }
}
private var kAssociationKeyMaxLength: Int = 0
extension UITextField {
@IBInspectable var maxLength: Int {
    get {
        if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
            return length
        } else {
            return Int.max
        }
    }
    set {
        objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
        self.addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
    }
}

func isInputMethod() -> Bool {
    if let positionRange = self.markedTextRange {
        if let _ = self.position(from: positionRange.start, offset: 0) {
            return true
        }
    }
    return false
}


@objc func checkMaxLength(textField: UITextField) {
    
    guard !self.isInputMethod(), let prospectiveText = self.text,
        prospectiveText.count > maxLength
        else {
            return
    }
    
    let selection = selectedTextRange
    let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
    text = prospectiveText.substring(to: maxCharIndex)
    selectedTextRange = selection
  }

}

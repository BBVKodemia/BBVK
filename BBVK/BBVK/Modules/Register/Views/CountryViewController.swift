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
        
        let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "Personal Information")
        view.addSubview(arrowButton)
        arrowButton.addAnchors(left: 20, top: 85, right: nil , bottom: nil)
        arrowButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        view.backgroundColor = UIColor.systemBackground
        
        view.addSubview(codeCountryTextField)
        codeCountryTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            codeCountryTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                          constant: 20),
            codeCountryTextField.widthAnchor.constraint(equalToConstant: 60),
            codeCountryTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                      constant: 80),
            codeCountryTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        codeCountryTextField.placeholder = "+ 52"
        codeCountryTextField.borderStyle = .roundedRect
        
        
        view.addSubview(phoneTextField)
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneTextField.leadingAnchor.constraint(equalTo: codeCountryTextField.trailingAnchor),
            phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -20),
            phoneTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                constant: 80),
            phoneTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        phoneTextField.placeholder = "Tu numero celular"
        phoneTextField.borderStyle = .roundedRect
        
        view.addSubview(continueButton)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                   constant: -20),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        continueButton.backgroundColor = .red
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

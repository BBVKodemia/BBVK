//
//  FormViewController.swift
//  BBVK
//
//  Created by Saúl Pérez on 01/04/22.
//

import UIKit

class FormViewController: UIViewController {
    let nameTextField = UITextField()
    let lastNameTextField = UITextField()
    let jobTextField = UITextField()
    let dateTextField = UITextField()
    let datePicker = UIDatePicker()
    let datePickerView = UIView()
    let continueButton = UIButton()
    let bbvkUtilities = initializerUI()
    var registerManager: RegisterManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDatePicker()
    }
    
    private func setupView() {
        
        let arrowButton = bbvkUtilities.ArrowButton(arrowBttnTxt: "Email Validation")
        view.addSubview(arrowButton)
        arrowButton.addAnchors(left: 20, top: 85, right: nil , bottom: nil)
        arrowButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                   constant: -20),
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                   constant: 80),
            nameTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        nameTextField.placeholder = "Nombre"
        nameTextField.borderStyle = .roundedRect
        
        view.addSubview(lastNameTextField)
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: 20),
            lastNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                   constant: -20),
            lastNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,
                                                   constant: 20),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        lastNameTextField.placeholder = "Apellidos"
        lastNameTextField.borderStyle = .roundedRect
        
        view.addSubview(jobTextField)
        jobTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            jobTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: 20),
            jobTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                   constant: -20),
            jobTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor,
                                              constant: 20),
            jobTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        jobTextField.placeholder = "Ocupacion"
        jobTextField.borderStyle = .roundedRect
        
        view.addSubview(dateTextField)
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: 20),
            dateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                   constant: -20),
            dateTextField.topAnchor.constraint(equalTo: jobTextField.bottomAnchor,
                                              constant: 20),
            dateTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        dateTextField.placeholder = "Fecha de nacimiento"
        dateTextField.borderStyle = .roundedRect
        
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
        
        
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        jobTextField.delegate = self
        dateTextField.delegate = self
    }
    
    @objc func continueFlow() {
        let validation = registerManager!.validatingData(name: nameTextField.text!, lastName: lastNameTextField.text!, occuppation: jobTextField.text!, birthDate: dateTextField.text!)
        if validation == true {
        let vc = CountryViewController()
        vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)}
        else {
            let alert = bbvkUtilities.alertViewSetter(tittle: "Some fields are empty", message: "Please fill all the fields in order to proceed", buttontittle: "ok")
                     self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func setupDatePicker() {
        view.addSubview(datePickerView)
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            datePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            datePickerView.topAnchor.constraint(equalTo: view.topAnchor),
            datePickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        datePickerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        datePicker.datePickerMode = .date
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePickerView.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        let backgroundDatePicker = UIView()
        datePickerView.addSubview(backgroundDatePicker)
        backgroundDatePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundDatePicker.leadingAnchor.constraint(equalTo: datePicker.leadingAnchor,
                                                          constant: -20),
            backgroundDatePicker.trailingAnchor.constraint(equalTo: datePicker.trailingAnchor,
                                                          constant: 20),
            backgroundDatePicker.topAnchor.constraint(equalTo: datePicker.topAnchor,
                                                          constant: -60),
            backgroundDatePicker.bottomAnchor.constraint(equalTo: datePicker.bottomAnchor,
                                                          constant: 55),
        ])
        backgroundDatePicker.backgroundColor = UIColor.systemBackground
        backgroundDatePicker.clipsToBounds = true
        backgroundDatePicker.layer.masksToBounds = true
        backgroundDatePicker.layer.cornerRadius = 8
        datePickerView.bringSubviewToFront(datePicker)
        
        
        let acceptButton = UIButton()
        backgroundDatePicker.addSubview(acceptButton)
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            acceptButton.leadingAnchor.constraint(equalTo: backgroundDatePicker.leadingAnchor,
                                                  constant: 20),
            acceptButton.trailingAnchor.constraint(equalTo: backgroundDatePicker.trailingAnchor,
                                                  constant: -20),
            acceptButton.heightAnchor.constraint(equalToConstant: 44),
            acceptButton.bottomAnchor.constraint(equalTo: backgroundDatePicker.bottomAnchor,
                                                 constant: -10)
        ])
        acceptButton.backgroundColor = .red
        acceptButton.clipsToBounds = true
        acceptButton.layer.masksToBounds = true
        acceptButton.layer.cornerRadius = 8
        acceptButton.setTitleColor(.white, for: .normal)
        acceptButton.setTitle("ACEPTAR", for: .normal)
        acceptButton.addTarget(self,
                               action: #selector(donedatePicker),
                               for: .touchUpInside)
        
        let titleLabel = UILabel()
        backgroundDatePicker.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: backgroundDatePicker.leadingAnchor,
                                                constant: 10),
            titleLabel.topAnchor.constraint(equalTo: backgroundDatePicker.topAnchor,
                                            constant: 20)
        ])
        titleLabel.text = "Seleccione su fecha de nacimiento"
        

        datePickerView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                   action: #selector(cancelDatePicker)))
   
        datePickerView.isHidden = true
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        datePickerView.isHidden = true
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
        datePickerView.isHidden = true
    }
    
    @objc func dismissView() {
       self.dismiss(animated: true, completion: nil)
    }
}



extension FormViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == dateTextField {
            datePickerView.isHidden = false
            view.endEditing(true)
            return false
        }else {
            return true
        }
    }
}

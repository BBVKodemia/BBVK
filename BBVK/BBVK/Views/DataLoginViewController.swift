//
//  DataLoginViewController.swift
//  BBVK
//
//  Created by Saúl Pérez on 22/03/22.
//

import UIKit

class DataLoginViewController: UIPageViewController {


    var pickerToolbar: UIToolbar?
    var dateTextField: UITextField?
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        
        self.navigationItem.title = "Main View"
        
        //create the UITextfield to present the Date Picker
        createUITextField()
        
        //create the Toolbar for Cancel and Done buttons
        createUIToolBar()
        
        //set date picker mode
        datePicker.datePickerMode = .date
        
        //add toolbar to textField
        dateTextField?.inputAccessoryView = pickerToolbar
        
        //add datepicker to textField
        dateTextField?.inputView = datePicker
        
    }
    
    func createUITextField(){
        
        let myLabel = UILabel()
        myLabel.textColor = UIColor.black
        myLabel.text = "Date: "
        myLabel.font = UIFont.systemFont(ofSize: 24.0)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myLabel)
        
        let myLabel2 = UILabel()
        myLabel2.textColor = UIColor.brown
        myLabel2.text = " (MM/DD/YY) "
        myLabel2.font = UIFont.systemFont(ofSize: 24.0)
        myLabel2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myLabel2)
        
        dateTextField = UITextField()
        dateTextField?.text = "Select a date ..."
        dateTextField?.textColor = UIColor.black
        dateTextField?.font = UIFont.systemFont(ofSize: 24.0)
        dateTextField?.layer.borderColor = UIColor.lightGray.cgColor
        dateTextField?.layer.borderWidth = 1.0
        dateTextField?.layer.cornerRadius = 3;
        dateTextField?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(dateTextField!)
        
        
        var allConstraints: [NSLayoutConstraint] = []
        let views = ["view": view!, "myLabel": myLabel, "dateTextField": dateTextField, "myLabel2": myLabel2]
        
        let horizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[myLabel]-[dateTextField(200)]-[myLabel2]-(>=10)-|",
            options: [.alignAllTop, .alignAllBottom], metrics: nil, views: views as [String : Any])
        allConstraints += horizontalConstraints
        
        var verticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-(>=40)-[myLabel]", metrics: nil, views: views as [String : Any])
        allConstraints += verticalConstraints
        verticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-(>=40)-[dateTextField]", metrics: nil, views: views as [String : Any])
        allConstraints += verticalConstraints
        verticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-(>=40)-[myLabel2]", metrics: nil, views: views as [String : Any])
        allConstraints += verticalConstraints
        
        
        NSLayoutConstraint.activate(allConstraints)
        
    }
    
    func createUIToolBar() {
        
        pickerToolbar = UIToolbar()
        pickerToolbar?.autoresizingMask = .flexibleHeight
        
        //customize the toolbar
        pickerToolbar?.barStyle = .default
        pickerToolbar?.barTintColor = UIColor.black
        pickerToolbar?.backgroundColor = UIColor.white
        pickerToolbar?.isTranslucent = false
        
        //add buttons
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action:
            #selector(cancelBtnClicked(_:)))
        cancelButton.tintColor = UIColor.white
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:
            #selector(DataLoginViewController.doneBtnClicked(_:)))
        doneButton.tintColor = UIColor.white
        
        //add the items to the toolbar
        pickerToolbar?.items = [cancelButton, flexSpace, doneButton]
        
    }
    
    @objc func cancelBtnClicked(_ button: UIBarButtonItem?) {
        dateTextField?.resignFirstResponder()
    }
    
    @objc func doneBtnClicked(_ button: UIBarButtonItem?) {
        dateTextField?.resignFirstResponder()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        dateTextField?.text = formatter.string(from: datePicker.date)
    }
    
    
}

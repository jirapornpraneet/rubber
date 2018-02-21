//
//  NewCustomerViewController.swift
//  tire
//
//  Created by Jiraporn Praneet on 20/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class NewCustomerViewController: UIViewController, UITextFieldDelegate, NVActivityIndicatorViewable {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var carBrandTextField: UITextField!
    @IBOutlet var licensePlateTextField: UITextField!
    @IBOutlet var provinceTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        carBrandTextField.delegate = self
        licensePlateTextField.delegate = self
        provinceTextField.delegate = self
        addressTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self

        let tapGestureRecognizerKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizerKeyboard)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextField {
            lastNameTextField.becomeFirstResponder()
        } else if textField == lastNameTextField {
            carBrandTextField.becomeFirstResponder()
        } else if textField == carBrandTextField {
            licensePlateTextField.becomeFirstResponder()
        } else if textField == licensePlateTextField {
            provinceTextField.becomeFirstResponder()
        } else if textField == provinceTextField {
            addressTextField.becomeFirstResponder()
        } else if textField == addressTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            phoneNumberTextField.becomeFirstResponder()
        } else if textField == phoneNumberTextField {
            saveClicked(self)
        }

        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setSaveButtonIsEnabled() {
        let editTexts = [firstNameTextField,
                         lastNameTextField,
                         carBrandTextField,
                         licensePlateTextField,
                         provinceTextField,
                         addressTextField,
                         emailTextField,
                         phoneNumberTextField]
        let emptyCount = editTexts
            .filter { (textField) -> Bool in
                textField?.text == "" }
            .count
        saveButton.isEnabled = emptyCount == 0
    }

    @IBAction func firstNameFieldEditingChanged(_ sender: Any) {
        setSaveButtonIsEnabled()
    }
    
    @IBAction func lastNameFieldEditingChanged(_ sender: Any) {
        setSaveButtonIsEnabled()
    }
    
    @IBAction func carBrandFieldEditingChanged(_ sender: Any) {
        setSaveButtonIsEnabled()
    }
    
    @IBAction func licensePlateFieldEditingChanged(_ sender: Any) {
        setSaveButtonIsEnabled()
    }
    
    @IBAction func provinceFieldEditingChanged(_ sender: Any) {
        setSaveButtonIsEnabled()
    }

    @IBAction func addressFieldEditingChanged(_ sender: Any) {
        setSaveButtonIsEnabled()
    }
    
    @IBAction func emailFieldEditingChanged(_ sender: Any) {
        setSaveButtonIsEnabled()
    }
    
    @IBAction func phoneNumberFieldEditingChanged(_ sender: Any) {
        setSaveButtonIsEnabled()
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        self.dismissKeyboard()
        startAnimating()
    }

}

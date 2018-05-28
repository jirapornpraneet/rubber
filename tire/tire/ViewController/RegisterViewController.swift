//
//  RegisterViewController.swift
//  tire
//
//  Created by Jiraporn Praneet on 8/5/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class RegisterViewController: UIViewController, UITextFieldDelegate, NVActivityIndicatorViewable {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)

        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        addressTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func dismissView(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextField {
            lastNameTextField.becomeFirstResponder()
        } else if textField == lastNameTextField {
            usernameTextField.becomeFirstResponder()
        } else if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            confirmPasswordTextField.becomeFirstResponder()
        } else if textField == confirmPasswordTextField {
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

    @IBAction func saveClicked(_ sender: Any) {
        self.dismissKeyboard()
        startAnimating()

        if passwordTextField.text != confirmPasswordTextField.text {
            showNotMatchPassword()
        } else {
            showConfirmSuccess()
        }
        self.stopAnimating()
    }

    func saveDataToApi() {
        RegisterManager().postRegister(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!,
                                       address: addressTextField.text!, username: usernameTextField.text!, password: passwordTextField.text!,
                                       email: emailTextField.text!, phoneNumber: phoneNumberTextField.text!,
                                       onSuccess: { (resource) in
                                        self.stopAnimating()
                                        self.showAlertSuccess()
        }, onFailure: { errorResource in
            self.stopAnimating()
            ErrorResult().showError(errorResource: errorResource, vc: self)
        })
    }

    func showConfirmSuccess() {
        let alertController = UIAlertController(title: R.string.localizable.confirmToCreate(),
                                                message: "",
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: R.string.localizable.oK(), style: .default, handler: { (action: UIAlertAction) in
            self.saveDataToApi()
        }))

        alertController.addAction(UIAlertAction(title: R.string.localizable.canceL(), style: .cancel, handler: { (action: UIAlertAction) in
        }))
        self.present(alertController, animated: true, completion: nil)
    }

    func showAlertSuccess() {
        let alertController = UIAlertController(title: R.string.localizable.success(),
                                                message: "",
                                                preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: R.string.localizable.oK(), style: UIAlertActionStyle.default) { (_: UIAlertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)

        self.present(alertController, animated: true, completion: nil)
    }

    func showNotMatchPassword() {
        let alertController = UIAlertController(title: R.string.localizable.passwordNotMatchPleaseTryAgain(),
                                                message: "",
                                                preferredStyle: UIAlertControllerStyle.alert)

        let okAction = UIAlertAction(title: R.string.localizable.oK(), style: UIAlertActionStyle.default) { (_: UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

}

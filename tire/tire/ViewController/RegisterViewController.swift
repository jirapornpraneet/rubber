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
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)

        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        addressTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func dismissView(_ sender: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveClicked(_ sender: Any) {
        self.dismissKeyboard()
        startAnimating()
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let userName = usernameTextField.text!
        let password = passwordTextField.text!
        let address = addressTextField.text!
        let email = emailTextField.text!
        let phoneNumber = phoneNumberTextField.text!

        RegisterManager().postRegister(firstName: firstName, lastName: lastName,
                                       address: address, username: userName, password: password,
                                       email: email, phoneNumber: phoneNumber,
                                       onSuccess: { (resource) in
                                        self.stopAnimating()
                                        self.showAlertSuccess()
        }, onFailure: { errorResource in
            self.stopAnimating()
            ErrorResult().showError(errorResource: errorResource, vc: self)
        })
    }

    func showAlertSuccess() {
        let alertController = UIAlertController(title: "บันทึก",
                                                message: "บันทึกข้อมูลเรียบร้อย",
                                                preferredStyle: UIAlertControllerStyle.alert)

        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (_: UIAlertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

}

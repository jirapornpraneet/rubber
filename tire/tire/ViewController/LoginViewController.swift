//
//  LoginViewController.swift
//  tire
//
//  Created by Jiraporn Praneet on 13/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController, UITextFieldDelegate, NVActivityIndicatorViewable {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGestureRecognizerKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizerKeyboard)

        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            loginClicked(self)
        }
        return true
    }

    func setLoginButtonIsEnabled() {
        let editTexts = [usernameTextField, passwordTextField]
        let emptyCount = editTexts
            .filter { (textField) -> Bool in
                textField?.text == "" }
            .count
        loginButton.isEnabled = emptyCount == 0
    }

    @IBAction func usernameFieldEditingChanged(_ sender: Any) {
        setLoginButtonIsEnabled()
    }

    @IBAction func passwordFieldEditingChanged(_ sender: Any) {
        setLoginButtonIsEnabled()
    }

    @IBAction func loginClicked(_ sender: Any) {
        self.dismissKeyboard()
        startAnimating()
//        LoginManager().login(identity: emailTextField.text!, password: passwordTextField.text!, onSuccess: {(resource) in
//            self.stopAnimating()
//            UserDefaults.saveAccessToken(value: resource.accessToken!)
//            
//            self.performSegue(withIdentifier: R.segue.loginViewController.toMainView, sender: nil)
//        }, onFailure: { errorResource in
//            self.stopAnimating()
//            ErrorResult().showError(errorResource: errorResource, vc: self)
//        })
    }
}

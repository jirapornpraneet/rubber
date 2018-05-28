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
    @IBOutlet var showPasswordButton: UIButton!

    var loginResource: LoginResource!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGestureRecognizerKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizerKeyboard)

        usernameTextField.delegate = self
        passwordTextField.delegate = self

        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
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

    @IBAction func showPasswordClicked() {
        let origImage = R.image.ic_remove_red_eye()
        let tintedImage = origImage?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        showPasswordButton.setImage(tintedImage, for: .normal)

        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            showPasswordButton.tintColor = UIColor.red
        } else {
            passwordTextField.isSecureTextEntry = true
            showPasswordButton.tintColor = UIColor.black
        }
    }

    @IBAction func loginClicked(_ sender: Any) {
        self.dismissKeyboard()
        startAnimating()
        LoginManager().login(username: usernameTextField.text!, password: passwordTextField.text!, onSuccess: {(resource) in
            self.stopAnimating()
            self.loginResource = resource
            UserDefaults.saveAccessToken(value: resource.accessToken!)
            if self.loginResource.isAdmin == false {
                UserDefaults.removeIsAdmin()
                self.performSegue(withIdentifier: R.segue.loginViewController.toCustomerView, sender: nil)
            } else {
                UserDefaults.saveIsAdmin(value: resource.isAdmin)
                self.performSegue(withIdentifier: R.segue.loginViewController.toMainView, sender: nil)
            }
        }, onFailure: { errorResource in
            self.stopAnimating()
            ErrorResult().showError(errorResource: errorResource, vc: self)
        })
    }
}

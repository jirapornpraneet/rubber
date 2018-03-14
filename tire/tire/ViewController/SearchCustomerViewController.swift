//
//  SearchCustomerViewController.swift
//  tire
//
//  Created by Jiraporn Praneet on 20/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SearchCustomerViewController: UIViewController, UITextFieldDelegate, NVActivityIndicatorViewable {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var searchButton: UIButton!

    var customerResources = [CustomerResource]()

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)

        firstNameTextField.delegate = self
        lastNameTextField.delegate = self

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
            searchClicked(self)
        }
        return true
    }

    func setSearchButtonIsEnabled() {
        let editTexts = [firstNameTextField, lastNameTextField]
        let emptyCount = editTexts
            .filter { (textField) -> Bool in
                textField?.text == "" }
            .count
        searchButton.isEnabled = emptyCount == 0
    }

    @IBAction func firstNameFieldEditingChanged(_ sender: Any) {
        setSearchButtonIsEnabled()
    }

    @IBAction func lastNameFieldEditingChanged(_ sender: Any) {
        setSearchButtonIsEnabled()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchClicked(_ sender: Any) {
        startAnimating()
        CustomerManager().getSearchCustomer(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, onSuccess: { (resource) in
            self.stopAnimating()
            self.customerResources = resource
            print("CustomerResource", self.customerResources)
            self.performSegue(withIdentifier: R.segue.searchCustomerViewController.toDataCustomer, sender: self)
        }, onFailure: { errorResource in
            self.stopAnimating()
            ErrorResult().showError(errorResource: errorResource, vc: self)
        })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let typedInfo = R.segue.searchCustomerViewController.toDataCustomer(segue: segue) {
            typedInfo.destination.customerResources = customerResources
        }
    }

    @IBAction func cancelClicked(_ sender: Any) {
        firstNameTextField.text = ""
        lastNameTextField.text = ""
    }
}

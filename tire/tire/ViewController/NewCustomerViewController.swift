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
    @IBOutlet var prefixLicenseTextField: UITextField!
    @IBOutlet var suffixLicenseTextField: UITextField!
    @IBOutlet var provinceTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var provinceView: UIView!
    @IBOutlet var productView: UIView!
    @IBOutlet var productTextField: UITextField!

    var productResource = [ProductResource]()
    var customerResource = CustomerResource()

    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        carBrandTextField.delegate = self
        prefixLicenseTextField.delegate = self
        suffixLicenseTextField.delegate = self
        provinceTextField.delegate = self
        addressTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        productTextField.delegate = self
        provinceTextField.text = "กรุงเทพมหานคร"

        let tapGestureRecognizerKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizerKeyboard)

        let tapGestureRecognizerProvinceView = UITapGestureRecognizer(target: self, action: #selector(provinceViewAction))
        provinceView.isUserInteractionEnabled = true
        provinceView.addGestureRecognizer(tapGestureRecognizerProvinceView)

        let tapGestureRecognizerProductView = UITapGestureRecognizer(target: self, action: #selector(productViewAction))
        productView.isUserInteractionEnabled = true
        productView.addGestureRecognizer(tapGestureRecognizerProductView)

        CustomerManager().getProduct(onSuccess: { (resource) in
            self.productResource = resource
            print("ProductNaJa", self.productResource)
        }, onFailure: { errorResource in
            ErrorResult().showError(errorResource: errorResource, vc: self)
        })
    }

    func receiveDataFromProvinceView(province: String) {
        provinceTextField.text = province
    }

    @objc func provinceViewAction() {
        self.view.endEditing(true)
        self.performSegue(withIdentifier: R.segue.newCustomerViewController.toSelectProvince, sender: self)
    }

    @objc func productViewAction() {
        self.view.endEditing(true)
        self.performSegue(withIdentifier: R.segue.newCustomerViewController.toSelectProduct, sender: self)
    }

    func receiveDataFromProductView(product: String) {
        productTextField.text = product
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
            prefixLicenseTextField.becomeFirstResponder()
        } else if textField == prefixLicenseTextField {
            suffixLicenseTextField.becomeFirstResponder()
        } else if textField == suffixLicenseTextField {
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
                         prefixLicenseTextField,
                         suffixLicenseTextField,
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

    @IBAction func prefixLicenseFieldEditingChanged(_ sender: Any) {
        setSaveButtonIsEnabled()
    }

    @IBAction func suffixLicenseFieldEditingChanged(_ sender: Any) {
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

    @IBAction func phoneNumberEditingChanged(_ sender: Any) {
        setSaveButtonIsEnabled()
    }

    @IBAction func saveClicked(_ sender: Any) {
        self.dismissKeyboard()
        startAnimating()
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let carBrand = carBrandTextField.text!
        let prefixLicense = prefixLicenseTextField.text!
        let suffixLicense = suffixLicenseTextField.text!
        let province = provinceTextField.text!
        let address = addressTextField.text!
        let email = emailTextField.text!
        let phoneNumber = phoneNumberTextField.text!
        let productId = 3

        CustomerManager().postCustomer(firstName: firstName, lastName: lastName,
                                       address: address, email: email, carBrand: carBrand,
                                       prefixLicense: prefixLicense, suffixLicense: suffixLicense,
                                       province: province, phoneNumber: phoneNumber,
                                       productId: productId,
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
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let typedInfo = R.segue.newCustomerViewController.toSelectProvince(segue: segue) {
            typedInfo.destination.delegate = self
        } else if let typedInfo = R.segue.newCustomerViewController.toSelectProduct(segue: segue){
            typedInfo.destination.productResource = productResource
            typedInfo.destination.delegate = self
        }
    }
}

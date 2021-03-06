//
//  AddProductViewController.swift
//  tire
//
//  Created by Jiraporn Praneet on 28/5/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class AddProductViewController: UIViewController, UITextFieldDelegate, NVActivityIndicatorViewable {

    @IBOutlet var provinceView: UIView!
    @IBOutlet var productView: UIView!
    @IBOutlet var productLabel: UILabel!
    @IBOutlet var storeView: UIView!
    @IBOutlet var storeLabel: UILabel!
    @IBOutlet var prefixLicenseTextField: UITextField!
    @IBOutlet var suffixLicenseTextField: UITextField!
    @IBOutlet var provinceLabel: UILabel!
    @IBOutlet var carBrandTextField: UITextField!
    @IBOutlet var saveButton: UIButton!

    var productResource = [ProductResource]()
    var storeResource = [StoreResource]()
    var customerResource = CustomerResource()
    var getProductId: Int = 0
    var getStoreId: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)

        carBrandTextField.delegate = self
        prefixLicenseTextField.delegate = self
        suffixLicenseTextField.delegate = self
        provinceLabel.text = "กรุงเทพมหานคร"
        productLabel.text = R.string.localizable.selectProduct()
        storeLabel.text = R.string.localizable.selectStore()

        let tapGestureRecognizerKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizerKeyboard)

        let tapGestureRecognizerProvinceView = UITapGestureRecognizer(target: self, action: #selector(provinceViewAction))
        provinceView.isUserInteractionEnabled = true
        provinceView.addGestureRecognizer(tapGestureRecognizerProvinceView)

        let tapGestureRecognizerProductView = UITapGestureRecognizer(target: self, action: #selector(productViewAction))
        productView.isUserInteractionEnabled = true
        productView.addGestureRecognizer(tapGestureRecognizerProductView)

        let tapGestureRecognizerStoreView = UITapGestureRecognizer(target: self, action: #selector(storeViewAction))
        storeView.isUserInteractionEnabled = true
        storeView.addGestureRecognizer(tapGestureRecognizerStoreView)

        CustomerManager().getProduct(onSuccess: { (resource) in
            self.productResource = resource
        }, onFailure: { errorResource in
            ErrorResult().showError(errorResource: errorResource, vc: self)
        })

        CustomerManager().getStore(onSuccess: { (resource) in
            self.storeResource = resource
        }, onFailure: { errorResource in
            ErrorResult().showError(errorResource: errorResource, vc: self)
        })
    }

    func receiveDataFromProvinceView(province: String) {
        provinceLabel.text = province
    }

    func receiveProductIdFromProductView(productId: Int) {
        getProductId = productId
    }

    func receiveStoreIdFromStoreView(storeId: Int) {
        getStoreId = storeId
    }

    @objc func provinceViewAction() {
        self.view.endEditing(true)
        self.performSegue(withIdentifier: R.segue.addProductViewController.toSelectProvince, sender: self)
    }

    @objc func productViewAction() {
        self.view.endEditing(true)
        self.performSegue(withIdentifier: R.segue.addProductViewController.toSelectProduct, sender: self)
    }

    @objc func storeViewAction() {
        self.view.endEditing(true)
        self.performSegue(withIdentifier: R.segue.addProductViewController.toSelectStore, sender: self)
    }

    func receiveDataFromProductView(product: String) {
        productLabel.text = product
    }

    func receiveDataFromStoreView(store: String) {
        storeLabel.text = store
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == prefixLicenseTextField {
            suffixLicenseTextField.becomeFirstResponder()
        } else if textField == suffixLicenseTextField {
            carBrandTextField.becomeFirstResponder()
        } else if textField == carBrandTextField {
            saveClicked(self)
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setSaveButtonIsEnabled() {
        let editTexts = [carBrandTextField,
                         prefixLicenseTextField,
                         suffixLicenseTextField]
        let emptyCount = editTexts
            .filter { (textField) -> Bool in
                textField?.text == "" }
            .count
        saveButton.isEnabled = emptyCount == 0
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

    @IBAction func saveClicked(_ sender: Any) {
        self.dismissKeyboard()
        startAnimating()
        CustomerManager().postAddProduct(productId: getProductId,
                                         carBrand: carBrandTextField.text!, prefixLicense: prefixLicenseTextField.text!,
                                         suffixLicense: suffixLicenseTextField.text!, province: provinceLabel.text!, storeId: getStoreId,
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
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let typedInfo = R.segue.addProductViewController.toSelectProvince(segue: segue) {
            typedInfo.destination.delegate = self
        } else if let typedInfo = R.segue.addProductViewController.toSelectProduct(segue: segue) {
            typedInfo.destination.productResource = productResource
            typedInfo.destination.delegate = self
        } else if let typedInfo = R.segue.addProductViewController.toSelectStore(segue: segue) {
            typedInfo.destination.storeResource = storeResource
            typedInfo.destination.delegate = self
        }
    }
}

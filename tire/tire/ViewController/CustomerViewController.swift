//
//  CustomerViewController.swift
//  tire
//
//  Created by Jiraporn Praneet on 21/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController {

    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var carBrandLabel: UILabel!
    @IBOutlet var licensePlateLabel: UILabel!
    @IBOutlet var provinceLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var productLabel: UILabel!
    @IBOutlet var productSinceLabel: UILabel!

    var customerResource = [CustomerResource]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let customerResources = customerResource[0]
        firstNameLabel.text = R.string.localizable.name(customerResources.firstName)
        lastNameLabel.text = R.string.localizable.surname(customerResources.lastName)
        carBrandLabel.text = R.string.localizable.carBrand(customerResources.carBrand)
        let licensePlate = customerResources.prefixLicense + customerResources.suffixLicense
        licensePlateLabel.text = R.string.localizable.licensePlateNumber(licensePlate)
        provinceLabel.text = R.string.localizable.province(customerResources.province)
        addressLabel.text = R.string.localizable.address(customerResources.address)
        emailLabel.text = R.string.localizable.email(customerResources.email)
        phoneNumberLabel.text = R.string.localizable.phoneNumber(customerResources.phoneNumber)
        productLabel.text = R.string.localizable.product(customerResources.productName)
        productSinceLabel.text = R.string.localizable.since(customerResources.createdAt)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

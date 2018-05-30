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
    @IBOutlet var productInformationLabel: UILabel!

    var customerResource: CustomerResource!

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)

        firstNameLabel.text = R.string.localizable.name(customerResource.firstName)
        lastNameLabel.text = R.string.localizable.surname(customerResource.lastName)
        carBrandLabel.text = R.string.localizable.carBrand(customerResource.carBrand)
        let licensePlate = customerResource.prefixLicense + " - " + customerResource.suffixLicense
        licensePlateLabel.text = R.string.localizable.licensePlateNumber(licensePlate)
        provinceLabel.text = R.string.localizable.province(customerResource.province)
        addressLabel.text = R.string.localizable.address(customerResource.address)
        emailLabel.text = R.string.localizable.email(customerResource.email)
        phoneNumberLabel.text = R.string.localizable.phoneNumber(customerResource.phoneNumber)
        productLabel.text = R.string.localizable.product(customerResource.productName)
        productSinceLabel.text = R.string.localizable.since((customerResource.createdAt?.toLongString())!)
        productInformationLabel.text = R.string.localizable.productInformation()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = customerResource.firstName + " - " + customerResource.lastName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

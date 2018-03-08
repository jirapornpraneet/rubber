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

    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameLabel.text = R.string.localizable.name("")
        lastNameLabel.text = R.string.localizable.surname("")
        carBrandLabel.text = R.string.localizable.carBrand("")
        licensePlateLabel.text = R.string.localizable.licensePlateNumber("")
        provinceLabel.text = R.string.localizable.province("")
        addressLabel.text = R.string.localizable.address("")
        emailLabel.text = R.string.localizable.email("")
        phoneNumberLabel.text = R.string.localizable.phoneNumber("")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
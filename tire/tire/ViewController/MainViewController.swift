//
//  MainViewController.swift
//  tire
//
//  Created by Jiraporn Praneet on 20/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var searchCustomerView: UIView!
    @IBOutlet var newCustomerView: UIView!
    @IBOutlet var allCustomerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizerSearchCustomerView = UITapGestureRecognizer(target: self, action: #selector(searchCustomerViewAction))
        searchCustomerView.isUserInteractionEnabled = true
        searchCustomerView.addGestureRecognizer(tapGestureRecognizerSearchCustomerView)

        let tapGestureRecognizerNewCustomerView = UITapGestureRecognizer(target: self, action: #selector(newCustomerViewAction))
        newCustomerView.isUserInteractionEnabled = true
        newCustomerView.addGestureRecognizer(tapGestureRecognizerNewCustomerView)

        let tapGestureRecognizerAllCustomerView = UITapGestureRecognizer(target: self, action: #selector(allCustomerViewAction))
        allCustomerView.isUserInteractionEnabled = true
        allCustomerView.addGestureRecognizer(tapGestureRecognizerAllCustomerView)

        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.navigationBar.topItem?.title = "K2K warranty"
    }

    @objc func searchCustomerViewAction() {
        self.view.endEditing(true)
        self.performSegue(withIdentifier: R.segue.mainViewController.toSearch, sender: self)
    }

    @objc func newCustomerViewAction() {
        self.view.endEditing(true)
        self.performSegue(withIdentifier: R.segue.mainViewController.toAdd, sender: self)
    }

    @objc func allCustomerViewAction() {
        self.view.endEditing(true)
        self.performSegue(withIdentifier: R.segue.mainViewController.toAllCustomer, sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logout(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: nil, message: R.string.localizable.logout(), preferredStyle: UIAlertControllerStyle.alert)

        let okAction = UIAlertAction(title: R.string.localizable.oK(), style: UIAlertActionStyle.destructive) { _ in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: notificationNamePresentLoginView), object: nil)
        }

        alert.addAction(okAction)
        alert.addAction(UIAlertAction(title: R.string.localizable.canceL(), style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

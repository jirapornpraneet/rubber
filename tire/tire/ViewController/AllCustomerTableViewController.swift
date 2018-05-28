//
//  AllCustomerTableViewController.swift
//  tire
//
//  Created by Jiraporn Praneet on 28/5/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class AllCustomerTableViewController: UITableViewController, NVActivityIndicatorViewable {

    var customerResources = [CustomerResource]()
    var indexRow: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        getAllCustomer()
    }

    func getAllCustomer() {
        startAnimating()
        CustomerManager().getAllCustomer(onSuccess: { (resource) in
            self.stopAnimating()
            self.customerResources = resource
            print("CustomerResource", self.customerResources)
        }, onFailure: { errorResource in
            self.stopAnimating()
            ErrorResult().showError(errorResource: errorResource, vc: self)
        })

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}

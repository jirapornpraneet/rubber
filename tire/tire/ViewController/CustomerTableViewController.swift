//
//  CustomerTableViewController.swift
//  tire
//
//  Created by Jiraporn Praneet on 14/3/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var licensePlateLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var provinceLabel: UILabel!
    @IBOutlet var sinceLabel: UILabel!
}

class CustomerTableViewController: UITableViewController {
    
    var customerResources = [CustomerResource]()
    var indexRow: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        print("customerResoueceeeee", customerResources)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return customerResources.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.customerCells, for: indexPath as IndexPath)!
        let cellData = customerResources[indexPath.row]

        let name = cellData.firstName + " " + cellData.lastName
        cell.nameLabel.text = R.string.localizable.name(name)
        let licensePlate = cellData.prefixLicense + " - " + cellData.suffixLicense
        cell.licensePlateLabel.text = R.string.localizable.licensePlateNumber(licensePlate)
        cell.provinceLabel.text = R.string.localizable.province(cellData.province)
        cell.emailLabel.text = R.string.localizable.email(cellData.email)
        cell.phoneNumberLabel.text = R.string.localizable.phoneNumber(cellData.phoneNumber)
        cell.sinceLabel.text = R.string.localizable.since((cellData.createdAt?.toLongString())!)
        cell.layoutIfNeeded()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        indexRow = indexPath.row
        self.performSegue(withIdentifier: R.segue.customerTableViewController.toDetailCustomer, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let typedInfo = R.segue.customerTableViewController.toDetailCustomer(segue: segue) {
            typedInfo.destination.customerResource = customerResources[indexRow]
        }
    }
}

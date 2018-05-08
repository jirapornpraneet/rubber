//
//  StoreTableViewController.swift
//  tire
//
//  Created by Jiraporn Praneet on 8/5/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit

class StoreTableViewController: UITableViewController {

    weak var delegate: NewCustomerViewController! = nil
    var storeResource = [StoreResource]()

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeResource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.storeCells, for: indexPath as IndexPath)!
        let storeResources = storeResource[indexPath.row]
        cell.textLabel?.text = storeResources.name
        cell.layoutIfNeeded()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        let storeResources = storeResource[indexPath.row]
        delegate.receiveDataFromStoreView(store: storeResources.name)
        delegate.receiveStoreIdFromStoreView(storeId: storeResources.id)
        _ = self.navigationController? .popViewController(animated: true)
    }
}

//
//  ProductTableViewController.swift
//  tire
//
//  Created by Jiraporn Praneet on 13/3/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {

    weak var delegate: AddProductViewController! = nil
    var productResource = [ProductResource]()

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
        return productResource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.productCells, for: indexPath as IndexPath)!
        let productResources = productResource[indexPath.row]
        cell.textLabel?.text = productResources.name
        cell.layoutIfNeeded()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        let productResources = productResource[indexPath.row]
        delegate.receiveDataFromProductView(product: productResources.name)
        delegate.receiveProductIdFromProductView(productId: productResources.id)
        _ = self.navigationController? .popViewController(animated: true)
    }
}

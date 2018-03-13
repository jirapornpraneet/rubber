//
//  ProductTableViewController.swift
//  tire
//
//  Created by Jiraporn Praneet on 13/3/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {

    weak var delegate: NewCustomerViewController! = nil
    var productResource: ProductResource!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.productCells, for: indexPath as IndexPath)!
        cell.textLabel?.text = productResource.name
        cell.layoutIfNeeded()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        delegate.receiveDataFromProductView(product: productResource.name)
        _ = self.navigationController? .popViewController(animated: true)
    }
}

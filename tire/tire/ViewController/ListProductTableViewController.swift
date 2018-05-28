//
//  ListProductTableViewController.swift
//  tire
//
//  Created by Jiraporn Praneet on 28/5/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import SSPullToRefresh

class ListProductTableViewCell: UITableViewCell {
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var storeNameLabel: UILabel!
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var licensePlateLabel: UILabel!
    @IBOutlet var provinceLabel: UILabel!
    @IBOutlet var sinceLabel: UILabel!
}

class ListProductTableViewController: UITableViewController,
NVActivityIndicatorViewable, SSPullToRefreshViewDelegate {

    var customerResources = [CustomerResource]()
    var indexRow: Int = 0
    var pullToRefreshView: SSPullToRefreshView!

    override func viewDidLoad() {
        super.viewDidLoad()
        pullToRefreshView = SSPullToRefreshView(scrollView: tableView, delegate: self)
        pullToRefreshView.startLoadingAndExpand(true, animated: true)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)

        self.tableView.delegate = self
        self.tableView.dataSource = self
        getListProduct()
    }

    func getListProduct() {
        startAnimating()
        CustomerManager().getListProduct(onSuccess: { (resource) in
            self.stopAnimating()
            self.pullToRefreshView.finishLoading()
            self.customerResources = resource
            self.tableView.reloadData()
        }, onFailure: { errorResource in
            self.stopAnimating()
            self.pullToRefreshView.finishLoading()
            ErrorResult().showError(errorResource: errorResource, vc: self)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numOfSections: Int = 0
        if customerResources.count > 0 {
            tableView.separatorStyle = .singleLine
            numOfSections = customerResources.count
            tableView.backgroundView = nil
        } else {
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text = R.string.localizable.resultNotFound()
            noDataLabel.textColor = UIColor.black
            noDataLabel.textAlignment = .center
            tableView.backgroundView = noDataLabel
            tableView.separatorStyle = .none
        }
        return numOfSections
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.listProductCells, for: indexPath as IndexPath)!
        let cellData = customerResources[indexPath.row]

        cell.productNameLabel.text = R.string.localizable.productName(cellData.productName)
        cell.storeNameLabel.text = R.string.localizable.store(cellData.storeName)
        cell.brandLabel.text = R.string.localizable.brand(cellData.carBrand)
        let licensePlate = cellData.prefixLicense + " - " + cellData.suffixLicense
        cell.licensePlateLabel.text = R.string.localizable.licensePlateNumber(licensePlate)
        cell.provinceLabel.text = R.string.localizable.province(cellData.province)
        cell.sinceLabel.text = cellData.createdAt?.toLongString()
        cell.layoutIfNeeded()
        return cell
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

    func pull(toRefreshViewDidStartLoading view: SSPullToRefreshView!) {
        pullToRefreshView.startLoading()
        getListProduct()
    }
}

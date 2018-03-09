//
//  CustomerManager.swift
//  tire
//
//  Created by Jiraporn Praneet on 21/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit
import Alamofire

let getCustomerPath = "/web/api-customer/create"
let getSearchCustomerPath = "/web/api-customer/search"

typealias CustomerResourceOnSuccess = (CustomerResource) -> Void
typealias CustomerResourceOnFailure = (ErrorResource) -> Void

typealias PostCustomerOnSuccess = (CustomerResource) -> Void
typealias PostCustomerOnFailure = (ErrorResource) -> Void

class CustomerManager: NSObject {
    func getCustomer(onSuccess: @escaping CustomerResourceOnSuccess, onFailure: @escaping CustomerResourceOnFailure) {
        BaseManager().get(path: getCustomerPath, onSuccess: { (response: CustomerResource) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })
    }

    func postCustomer(firstName: String, lastName: String, carBrand: String,
                      licensePlate: String, province: String, address: String,
                      email: String, phoneNumber: String, onSuccess: @escaping PostCustomerOnSuccess,
                      onFailure: @escaping PostCustomerOnFailure) {
        let params = ["firstName": firstName, "lastName": lastName, "carBrand": carBrand,
                      "licensePlate": licensePlate, "province": province, "address": address,
                      "email": email, "phoneNumber": phoneNumber]
        BaseManager().post(path: getCustomerPath, params: params, onSuccess: { (response: CustomerResource) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })
    }

    func getSearchCustomer(firstName: String, lastName: String, onSuccess: @escaping CustomerResourceOnSuccess, onFailure: @escaping CustomerResourceOnFailure) {

        var params = [String: String]()

        if !firstName.isEmpty {
            params["fitstName"] = firstName
        }

        if !lastName.isEmpty {
            params["lastName"] = lastName
        }

        BaseManager().get(path: getSearchCustomerPath, params: params, onSuccess: { (response: CustomerResource) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })

    }

}

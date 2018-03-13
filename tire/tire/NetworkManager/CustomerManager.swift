//
//  CustomerManager.swift
//  tire
//
//  Created by Jiraporn Praneet on 21/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit
import Alamofire

let postCustomerPath = "/web/api-customer/create"
let getSearchCustomerPath = "/web/api-customer/search"
let getProductPath = "/web/api-product/get-product"

typealias CustomerResourceOnSuccess = (CustomerResource) -> Void
typealias CustomerResourceOnFailure = (ErrorResource) -> Void

typealias ProductResourceOnSuccess = (ProductResource) -> Void
typealias ProductResourceOnFailure = (ErrorResource) -> Void

typealias PostCustomerOnSuccess = (CustomerResource) -> Void
typealias PostCustomerOnFailure = (ErrorResource) -> Void

class CustomerManager: NSObject {
    func postCustomer(firstName: String, lastName: String, address: String,
                      email: String, carBrand: String, prefixLicense: String,
                      suffixLicense: String, province: String, phoneNumber : String,
                      onSuccess: @escaping PostCustomerOnSuccess,
                      onFailure: @escaping PostCustomerOnFailure) {
        let params = ["firstName": firstName, "lastName": lastName, "address": address,
                      "email": email, "carBrand": carBrand, "prefixLicense": prefixLicense,
                      "suffixLicense": suffixLicense, "province": province, "phoneNumber": phoneNumber]
        BaseManager().post(path: postCustomerPath, params: params, onSuccess: { (response: CustomerResource) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })
    }

    func getProduct(onSuccess: @escaping ProductResourceOnSuccess, onFailure: @escaping ProductResourceOnFailure) {

        BaseManager().get(path: getProductPath, onSuccess: { (response: ProductResource) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })
    }

    func getSearchCustomer(firstName: String, lastName: String, onSuccess: @escaping CustomerResourceOnSuccess, onFailure: @escaping CustomerResourceOnFailure) {

        let params = ["firstName": firstName, "lastName": lastName]

        BaseManager().get(path: getSearchCustomerPath, params: params, onSuccess: { (response: CustomerResource) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })

    }

}

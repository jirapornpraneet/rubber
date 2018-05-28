//
//  CustomerManager.swift
//  tire
//
//  Created by Jiraporn Praneet on 21/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit
import Alamofire

let postAddProductPath = "/web/api-product/add-product"
let getSearchCustomerPath = "/web/api-product/customer-search"
let getProductPath = "/web/api-product/get-product"
let getStorePath = "/web/api-store/get-store"
let getAllCustomerPath = "/web/api-product/customer-all"
let getListProductPath = "/web/api-product/list-product"

typealias CustomerResourceOnSuccess = ([CustomerResource]) -> Void
typealias CustomerResourceOnFailure = (ErrorResource) -> Void

typealias ProductResourceOnSuccess = ([ProductResource]) -> Void
typealias ProductResourceOnFailure = (ErrorResource) -> Void

typealias StoreResourceOnSuccess = ([StoreResource]) -> Void
typealias StoreResourceOnFailure = (ErrorResource) -> Void

typealias PostAddProductOnSuccess = (CustomerResource) -> Void
typealias PostAddProductOnFailure = (ErrorResource) -> Void

class CustomerManager: NSObject {
    func postAddProduct(productId: Int, carBrand: String, prefixLicense: String,
                        suffixLicense: String, province: String, storeId: Int,
                        onSuccess: @escaping PostAddProductOnSuccess,
                        onFailure: @escaping PostAddProductOnFailure) {

        let params = ["productId": productId, "carBrand": carBrand, "prefixLicense": prefixLicense,
                      "suffixLicense": suffixLicense, "province": province, "storeId": storeId] as [String: Any]
        BaseManager().post(path: postAddProductPath, params: params, onSuccess: { (response: CustomerResource) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })
    }

    func getProduct(onSuccess: @escaping ProductResourceOnSuccess, onFailure: @escaping ProductResourceOnFailure) {

        BaseManager().get(path: getProductPath, onSuccess: { (response: [ProductResource]) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })
    }

    func getStore(onSuccess: @escaping StoreResourceOnSuccess, onFailure: @escaping StoreResourceOnFailure) {

        BaseManager().get(path: getStorePath, onSuccess: { (response: [StoreResource]) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })
    }

    func getSearchCustomer(firstName: String, lastName: String, onSuccess: @escaping CustomerResourceOnSuccess, onFailure: @escaping CustomerResourceOnFailure) {

        let params = ["firstName": firstName, "lastName": lastName]

        BaseManager().get(path: getSearchCustomerPath, params: params, onSuccess: { (response: [CustomerResource]) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })
    }

    func getAllCustomer(onSuccess: @escaping CustomerResourceOnSuccess, onFailure: @escaping CustomerResourceOnFailure) {

        BaseManager().get(path: getAllCustomerPath, onSuccess: { (response: [CustomerResource]) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })
    }

    func getListProduct(onSuccess: @escaping CustomerResourceOnSuccess, onFailure: @escaping CustomerResourceOnFailure) {

        BaseManager().get(path: getListProductPath, onSuccess: { (response: [CustomerResource]) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })
    }
}

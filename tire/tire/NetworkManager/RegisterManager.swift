//
//  RegisterManager.swift
//  tire
//
//  Created by Jiraporn Praneet on 8/5/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit
import Alamofire

let registerPath = "/web/api-user/register"

typealias PostRegisterOnSuccess = (RegisterResource) -> Void
typealias PostRegisterOnFailure = (ErrorResource) -> Void

class RegisterManager: NSObject {
    func postRegister(firstName: String, lastName: String, address: String,
                      username: String, password: String, email: String,
                      phoneNumber: String, onSuccess: @escaping PostRegisterOnSuccess,
                      onFailure: @escaping PostRegisterOnFailure) {

        let params = ["firstName": firstName, "lastName": lastName, "address": address,
                      "username": username, "password": password, "email": email,
                      "phoneNumber": phoneNumber] as [String : Any]
        BaseManager().post(path: registerPath, params: params, onSuccess: { (response: RegisterResource) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })
    }
}

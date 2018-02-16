//
//  LoginManager.swift
//  tire
//
//  Created by Jiraporn Praneet on 16/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import Alamofire

let loginPath = "/api/v1/auth/login"

typealias LoginResourceOnSuccess = (LoginResource) -> Void
typealias LoginResourceOnFailure = (ErrorResource) -> Void

class LoginManager: NSObject {
    func login(username: String, password: String, onSuccess: @escaping  LoginResourceOnSuccess, onFailure: @escaping LoginResourceOnFailure) {
        let params = ["username": username, "password": password, "personUserMode": "true" ]
        
        BaseManager().post(path: loginPath, params: params, onSuccess: { (response: LoginResource) in
            onSuccess(response)
        }, onFailure: { errorResource in
            onFailure(errorResource)
        })
    }
}

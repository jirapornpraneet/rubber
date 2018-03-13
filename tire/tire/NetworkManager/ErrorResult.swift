//
//  ErrorResult.swift
//  tire
//
//  Created by Jiraporn Praneet on 16/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import Foundation
import Alamofire
import KRProgressHUD

let httpStatusInvalidAccessToken = -2
let httpStatusNetworkError = -1
let httpStatusUnAuthorized = 401
let httpStatusForbidden = 403
let httpStatusInternalServerError = 500
let httpStatusBadRequest = 400

public class ErrorResult {
    var code: Int = 0
    var message: String? = ""
    var description: String? = ""

    func parseApiError(error: NSError) -> ErrorResult {
        let result = ErrorResult()

        if let description = error.userInfo["NSLocalizedDescription"] as? String {
            result.message = description
        } else if let messageError = error.userInfo["message"] as? String {
            result.message = messageError
        } else if let statusCode = error.userInfo["StatusCode"] as? Int {
            result.code = statusCode
        }

        if result.message!.hasPrefix("The Internet connection appears to be offline") {
            result.code = httpStatusNetworkError
            result.message = "The Internet connection appears to be offline"
        } else if result.message!.hasPrefix("The request timed out") {
            result.code = httpStatusNetworkError
            result.message = "The request timed out"
        } else if result.message!.hasPrefix("Incorrect username or password.") {
            result.code = httpStatusBadRequest
            result.message = "Incorrect username or password."
        } else if result.message!.hasPrefix("Your request was made with invalid credentials") {
            result.code = httpStatusNetworkError
            result.message = "Your request was made with invalid credentials"

            let loginViewController = R.storyboard.main.login()!
            let window = UIApplication.shared.windows[0] as UIWindow

            let alert = UIAlertController(title: "Sorry", message: result.message, preferredStyle: UIAlertControllerStyle.alert)

            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (_ : UIAlertAction) -> Void in
            }

            UIView.transition(
                from: window.rootViewController!.view,
                to: loginViewController.view,
                duration: 1,
                options: .transitionCurlUp,
                completion: { _ in
                    window.rootViewController = loginViewController
                    UserDefaults.removeAllKey()
                    alert.addAction(okAction)
                    loginViewController.present(alert, animated: true, completion: nil)
            })
        }
        return result
    }

    func showError(errorResource: ErrorResource, vc: AnyObject) {
        if errorResource.status == httpStatusUnAuthorized {
            let alert =
                UIAlertController(
                    title: "",
                    message: String(format: "%i \n%@", errorResource.status, errorResource.message),
                    preferredStyle: UIAlertControllerStyle.alert)
            alert
                .addAction(UIAlertAction(
                    title: "Ok",
                    style: UIAlertActionStyle.default,
                    handler: { (_) in
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notificationNamePresentLoginView), object: nil)
                }))

            vc.present(alert, animated: true, completion: nil)
            return
        }

        if errorResource.status == 0 {
            let alert =
                UIAlertController(
                    title: "Something wrong!",
                    message: String(format: "Result not found", errorResource.status, errorResource.message),
                    preferredStyle: UIAlertControllerStyle.alert)
            alert
                .addAction(UIAlertAction(
                    title: "Ok",
                    style: UIAlertActionStyle.default,
                    handler: nil))
            vc.present(alert, animated: true, completion: nil)
        }

        let alert =
            UIAlertController(
                title: "Something wrong!",
                message: String(format: "%i \n%@", errorResource.status, errorResource.message),
                preferredStyle: UIAlertControllerStyle.alert)
        alert
            .addAction(UIAlertAction(
                title: "Ok",
                style: UIAlertActionStyle.default,
                handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}

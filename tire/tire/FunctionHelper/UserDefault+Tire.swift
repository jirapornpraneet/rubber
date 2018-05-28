//
//  UserDefault+Tire.swift
//  tire
//
//  Created by Jiraporn Praneet on 15/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit
import Foundation

let accessToken: String = "accessToken"
let fcmToken: String = "fcmToken"
let isAdmin: String = "true"

extension UserDefaults {

    class func saveAccessToken(value: String) {
        UserDefaults.standard.setValue(value, forKey: accessToken)
        UserDefaults.standard.synchronize()
    }

    class func loadAccessToken() -> String {
        return UserDefaults.standard.string(forKey: accessToken) ?? ""
    }

    class func removeAccessToken() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: accessToken)
    }

    class func saveFCMToken(value: String) {
        UserDefaults.standard.setValue(value, forKey: fcmToken)
        UserDefaults.standard.synchronize()
    }

    class func loadFCMToken() -> String? {
        return UserDefaults.standard.string(forKey: fcmToken)
    }

    class func removeFCMToken() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: fcmToken)
    }

    class func removeAllKey() {
        for key in Array(UserDefaults.standard.dictionaryRepresentation().keys) {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }

    class func saveIsAdmin(value: Bool) {
        UserDefaults.standard.setValue(value, forKey: isAdmin)
        UserDefaults.standard.synchronize()
    }

    class func loadIsAdmin() -> Bool {
        return UserDefaults.standard.bool(forKey: isAdmin)
    }

    class func removeIsAdmin() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: isAdmin)
    }
}

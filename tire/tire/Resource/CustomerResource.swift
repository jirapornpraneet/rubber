//
//  CustomerResource.swift
//  tire
//
//  Created by Jiraporn Praneet on 16/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import Foundation
import EVReflection

public class CustomerResource: EVObject {
    var id: Int = 0
    var firstName: String = ""
    var lastName: String = ""
    var address: String = ""
    var email: String = ""
    var carBrand: String = ""
    var prefixLicense: String = ""
    var suffixLicense: String = ""
    var province: String = ""
    var createdAt: Date?
    var updatedAt: Date?
    var phoneNumber: String = ""
    var productId: Int = 0
    var productName: String = ""
    var storeName: String = ""

    override public func decodePropertyValue(value: Any, key: String) -> Any? {
        let keys = ["updatedAt", "createdAt"]
        if keys.contains(key) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 7)
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            let date = dateFormatter.date(from: value as! String)
            return date
        }
        return value
    }
}

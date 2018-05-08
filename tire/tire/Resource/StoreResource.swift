//
//  StoreResource.swift
//  tire
//
//  Created by Jiraporn Praneet on 8/5/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import Foundation
import EVReflection

class StoreResource: EVObject {
    var id: Int = 0
    var name: String = ""
    var status: Int = 0
    var createdAt: Date?
    var updatedAt: Data?

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

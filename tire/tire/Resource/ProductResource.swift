//
//  ProductResource.swift
//  tire
//
//  Created by Jiraporn Praneet on 13/3/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import Foundation
import EVReflection

public class ProductResource: EVObject {
    var id: Int = 0
    var name: String = ""
    var status: Int = 0
    var createdAt: Date?

    override public func decodePropertyValue(value: Any, key: String) -> Any? {
        if key == "createdAt" {
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

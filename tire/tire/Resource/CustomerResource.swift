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
    var createdAt: String = ""
    var updatedAt: String = ""
}

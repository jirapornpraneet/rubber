//
//  FunctionHelper.swift
//  tire
//
//  Created by Jiraporn Praneet on 15/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit

let notificationNamePresentLoginView: String = "presentLoginView"

class FunctionHelper: NSObject {

}

extension Date {
    func toLongString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy HH:mm"
        return formatter.string(from: self)
    }
}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

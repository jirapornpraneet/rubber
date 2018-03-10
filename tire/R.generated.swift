//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `GoogleService-Info.plist`.
    static let googleServiceInfoPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "GoogleService-Info", pathExtension: "plist")
    
    /// `bundle.url(forResource: "GoogleService-Info", withExtension: "plist")`
    static func googleServiceInfoPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.googleServiceInfoPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 3 images.
  struct image {
    /// Image `ic_done_white`.
    static let ic_done_white = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_done_white")
    /// Image `ic_exit_to_app_white_36pt`.
    static let ic_exit_to_app_white_36pt = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_exit_to_app_white_36pt")
    /// Image `ic_nika`.
    static let ic_nika = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_nika")
    
    /// `UIImage(named: "ic_done_white", bundle: ..., traitCollection: ...)`
    static func ic_done_white(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_done_white, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_exit_to_app_white_36pt", bundle: ..., traitCollection: ...)`
    static func ic_exit_to_app_white_36pt(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_exit_to_app_white_36pt, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_nika", bundle: ..., traitCollection: ...)`
    static func ic_nika(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_nika, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 2 view controllers.
  struct segue {
    /// This struct is generated for `LoginViewController`, and contains static references to 1 segues.
    struct loginViewController {
      /// Segue identifier `toMainView`.
      static let toMainView: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, LoginViewController, UIKit.UINavigationController> = Rswift.StoryboardSegueIdentifier(identifier: "toMainView")
      
      /// Optionally returns a typed version of segue `toMainView`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func toMainView(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, LoginViewController, UIKit.UINavigationController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.loginViewController.toMainView, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    /// This struct is generated for `SearchCustomerViewController`, and contains static references to 1 segues.
    struct searchCustomerViewController {
      /// Segue identifier `toDataCustomer`.
      static let toDataCustomer: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, SearchCustomerViewController, CustomerViewController> = Rswift.StoryboardSegueIdentifier(identifier: "toDataCustomer")
      
      /// Optionally returns a typed version of segue `toDataCustomer`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func toDataCustomer(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, SearchCustomerViewController, CustomerViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.searchCustomerViewController.toDataCustomer, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 3 localization tables.
  struct string {
    /// This `R.string.launchScreen` struct is generated, and contains static references to 0 localization keys.
    struct launchScreen {
      fileprivate init() {}
    }
    
    /// This `R.string.localizable` struct is generated, and contains static references to 8 localization keys.
    struct localizable {
      /// en translation: Address : %@
      /// 
      /// Locales: en
      static let address = Rswift.StringResource(key: "Address : %@", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Car brand : %@
      /// 
      /// Locales: en
      static let carBrand = Rswift.StringResource(key: "Car brand : %@", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Email : %@
      /// 
      /// Locales: en
      static let email = Rswift.StringResource(key: "Email : %@", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: License plate number : %@
      /// 
      /// Locales: en
      static let licensePlateNumber = Rswift.StringResource(key: "License plate number : %@", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Name : %@
      /// 
      /// Locales: en
      static let name = Rswift.StringResource(key: "Name : %@", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Phone number : %@
      /// 
      /// Locales: en
      static let phoneNumber = Rswift.StringResource(key: "Phone number : %@", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Province : %@
      /// 
      /// Locales: en
      static let province = Rswift.StringResource(key: "Province : %@", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Surname : %@
      /// 
      /// Locales: en
      static let surname = Rswift.StringResource(key: "Surname : %@", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      
      /// en translation: Address : %@
      /// 
      /// Locales: en
      static func address(_ value1: String) -> String {
        return String(format: NSLocalizedString("Address : %@", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// en translation: Car brand : %@
      /// 
      /// Locales: en
      static func carBrand(_ value1: String) -> String {
        return String(format: NSLocalizedString("Car brand : %@", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// en translation: Email : %@
      /// 
      /// Locales: en
      static func email(_ value1: String) -> String {
        return String(format: NSLocalizedString("Email : %@", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// en translation: License plate number : %@
      /// 
      /// Locales: en
      static func licensePlateNumber(_ value1: String) -> String {
        return String(format: NSLocalizedString("License plate number : %@", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// en translation: Name : %@
      /// 
      /// Locales: en
      static func name(_ value1: String) -> String {
        return String(format: NSLocalizedString("Name : %@", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// en translation: Phone number : %@
      /// 
      /// Locales: en
      static func phoneNumber(_ value1: String) -> String {
        return String(format: NSLocalizedString("Phone number : %@", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// en translation: Province : %@
      /// 
      /// Locales: en
      static func province(_ value1: String) -> String {
        return String(format: NSLocalizedString("Province : %@", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// en translation: Surname : %@
      /// 
      /// Locales: en
      static func surname(_ value1: String) -> String {
        return String(format: NSLocalizedString("Surname : %@", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      fileprivate init() {}
    }
    
    /// This `R.string.main` struct is generated, and contains static references to 42 localization keys.
    struct main {
      /// th translation: Address
      /// 
      /// Locales: th
      static let bDMVq3KrPlaceholder = Rswift.StringResource(key: "bDM-vq-3Kr.placeholder", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Address
      /// 
      /// Locales: th
      static let wcGQqLjpText = Rswift.StringResource(key: "wcG-qq-ljp.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Address : %s
      /// 
      /// Locales: th
      static let r6CHkYNIText = Rswift.StringResource(key: "R6C-hk-yNI.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Car brand
      /// 
      /// Locales: th
      static let aVRM5AzVText = Rswift.StringResource(key: "aVR-M5-azV.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Car brand
      /// 
      /// Locales: th
      static let xjyNcNYqPlaceholder = Rswift.StringResource(key: "XJY-nc-NYq.placeholder", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Car brand : %s
      /// 
      /// Locales: th
      static let zL0FAWNLText = Rswift.StringResource(key: "zL0-fA-WNL.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Customer information
      /// 
      /// Locales: th
      static let x510R2D1Text = Rswift.StringResource(key: "x51-0R-2D1.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Customer search
      /// 
      /// Locales: th
      static let wvhon37jText = Rswift.StringResource(key: "WVH-oN-37j.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Email
      /// 
      /// Locales: th
      static let oIhSWYoaText = Rswift.StringResource(key: "oIh-sW-yoa.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Email
      /// 
      /// Locales: th
      static let obhMdFKQPlaceholder = Rswift.StringResource(key: "obh-md-fKQ.placeholder", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Email : %s
      /// 
      /// Locales: th
      static let jwNBhJLzText = Rswift.StringResource(key: "jwN-bh-jLz.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: First name
      /// 
      /// Locales: th
      static let f4V5VUjText = Rswift.StringResource(key: "3f4-v5-VUj.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: First name
      /// 
      /// Locales: th
      static let xKhRZIYJPlaceholder = Rswift.StringResource(key: "xKh-RZ-IYJ.placeholder", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: LOGIN
      /// 
      /// Locales: th
      static let jr3HyBH8NormalTitle = Rswift.StringResource(key: "jr3-Hy-BH8.normalTitle", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Last name
      /// 
      /// Locales: th
      static let gYiHOFiHPlaceholder = Rswift.StringResource(key: "GYi-HO-fiH.placeholder", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Last name
      /// 
      /// Locales: th
      static let odCO3JSzText = Rswift.StringResource(key: "odC-O3-JSz.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: License plate
      /// 
      /// Locales: th
      static let lisfef2mPlaceholder = Rswift.StringResource(key: "LIS-FE-f2m.placeholder", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: License plate
      /// 
      /// Locales: th
      static let mpkY5TqcText = Rswift.StringResource(key: "mpk-Y5-Tqc.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: License plate number : %s
      /// 
      /// Locales: th
      static let mb864AXText = Rswift.StringResource(key: "1Mb-86-4AX.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Menu
      /// 
      /// Locales: th
      static let yy83CLRnText = Rswift.StringResource(key: "YY8-3C-lRn.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: NEW CUSTOMER
      /// 
      /// Locales: th
      static let kd45UWzJNormalTitle = Rswift.StringResource(key: "Kd4-5U-WzJ.normalTitle", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Name
      /// 
      /// Locales: th
      static let wcY61WcbText = Rswift.StringResource(key: "WcY-61-wcb.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Name : %s
      /// 
      /// Locales: th
      static let gThNWAv4Text = Rswift.StringResource(key: "gTh-nW-av4.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Password
      /// 
      /// Locales: th
      static let gzdGSDAjPlaceholder = Rswift.StringResource(key: "gzd-GS-dAj.placeholder", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Phone number
      /// 
      /// Locales: th
      static let bCrTdJgrText = Rswift.StringResource(key: "bCr-Td-Jgr.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Phone number
      /// 
      /// Locales: th
      static let wBnYiIYkPlaceholder = Rswift.StringResource(key: "WBn-yi-iYk.placeholder", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Phone number : %s
      /// 
      /// Locales: th
      static let nedNH71KText = Rswift.StringResource(key: "ned-NH-71K.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Please fill in the blank
      /// 
      /// Locales: th
      static let cIZLKGX0Text = Rswift.StringResource(key: "cIZ-lK-gX0.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Province
      /// 
      /// Locales: th
      static let kNv2nLQ3Placeholder = Rswift.StringResource(key: "KNv-2n-lQ3.placeholder", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Province
      /// 
      /// Locales: th
      static let oHcOlOkBText = Rswift.StringResource(key: "oHc-Ol-OkB.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Province : %s
      /// 
      /// Locales: th
      static let dco16WQVText = Rswift.StringResource(key: "dco-16-WQV.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: SEARCH
      /// 
      /// Locales: th
      static let hChQ3EejNormalTitle = Rswift.StringResource(key: "hCh-q3-eej.normalTitle", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: SEARCH CUSTOMER
      /// 
      /// Locales: th
      static let gFZThH8BNormalTitle = Rswift.StringResource(key: "gFZ-th-H8B.normalTitle", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Surname
      /// 
      /// Locales: th
      static let o136mJqWText = Rswift.StringResource(key: "O13-6m-jqW.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Surname
      /// 
      /// Locales: th
      static let qM1Z7x3Placeholder = Rswift.StringResource(key: "3qM-1Z-7x3.placeholder", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Surname : %s
      /// 
      /// Locales: th
      static let x8WYnDNdText = Rswift.StringResource(key: "x8W-yn-DNd.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: TireShop
      /// 
      /// Locales: th
      static let dwq5uUFxTitle = Rswift.StringResource(key: "dwq-5u-uFx.title", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: TireShop
      /// 
      /// Locales: th
      static let eYqFM7USText = Rswift.StringResource(key: "EYq-fM-7US.text", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: TireShop
      /// 
      /// Locales: th
      static let gacGBBLqTitle = Rswift.StringResource(key: "Gac-GB-BLq.title", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: Username
      /// 
      /// Locales: th
      static let uMVXQUhnPlaceholder = Rswift.StringResource(key: "uMV-xQ-uhn.placeholder", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: name
      /// 
      /// Locales: th
      static let rF7JsxPlaceholder = Rswift.StringResource(key: "92r-F7-Jsx.placeholder", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      /// th translation: ยกเลิก
      /// 
      /// Locales: th
      static let nJiY6FWnNormalTitle = Rswift.StringResource(key: "NJi-Y6-FWn.normalTitle", tableName: "Main", bundle: R.hostingBundle, locales: ["th"], comment: nil)
      
      /// th translation: Address
      /// 
      /// Locales: th
      static func bDMVq3KrPlaceholder(_: Void = ()) -> String {
        return NSLocalizedString("bDM-vq-3Kr.placeholder", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Address
      /// 
      /// Locales: th
      static func wcGQqLjpText(_: Void = ()) -> String {
        return NSLocalizedString("wcG-qq-ljp.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Address : %s
      /// 
      /// Locales: th
      static func r6CHkYNIText(_ value1: UnsafePointer<unichar>) -> String {
        return String(format: NSLocalizedString("R6C-hk-yNI.text", tableName: "Main", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// th translation: Car brand
      /// 
      /// Locales: th
      static func aVRM5AzVText(_: Void = ()) -> String {
        return NSLocalizedString("aVR-M5-azV.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Car brand
      /// 
      /// Locales: th
      static func xjyNcNYqPlaceholder(_: Void = ()) -> String {
        return NSLocalizedString("XJY-nc-NYq.placeholder", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Car brand : %s
      /// 
      /// Locales: th
      static func zL0FAWNLText(_ value1: UnsafePointer<unichar>) -> String {
        return String(format: NSLocalizedString("zL0-fA-WNL.text", tableName: "Main", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// th translation: Customer information
      /// 
      /// Locales: th
      static func x510R2D1Text(_: Void = ()) -> String {
        return NSLocalizedString("x51-0R-2D1.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Customer search
      /// 
      /// Locales: th
      static func wvhon37jText(_: Void = ()) -> String {
        return NSLocalizedString("WVH-oN-37j.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Email
      /// 
      /// Locales: th
      static func oIhSWYoaText(_: Void = ()) -> String {
        return NSLocalizedString("oIh-sW-yoa.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Email
      /// 
      /// Locales: th
      static func obhMdFKQPlaceholder(_: Void = ()) -> String {
        return NSLocalizedString("obh-md-fKQ.placeholder", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Email : %s
      /// 
      /// Locales: th
      static func jwNBhJLzText(_ value1: UnsafePointer<unichar>) -> String {
        return String(format: NSLocalizedString("jwN-bh-jLz.text", tableName: "Main", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// th translation: First name
      /// 
      /// Locales: th
      static func f4V5VUjText(_: Void = ()) -> String {
        return NSLocalizedString("3f4-v5-VUj.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: First name
      /// 
      /// Locales: th
      static func xKhRZIYJPlaceholder(_: Void = ()) -> String {
        return NSLocalizedString("xKh-RZ-IYJ.placeholder", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: LOGIN
      /// 
      /// Locales: th
      static func jr3HyBH8NormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("jr3-Hy-BH8.normalTitle", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Last name
      /// 
      /// Locales: th
      static func gYiHOFiHPlaceholder(_: Void = ()) -> String {
        return NSLocalizedString("GYi-HO-fiH.placeholder", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Last name
      /// 
      /// Locales: th
      static func odCO3JSzText(_: Void = ()) -> String {
        return NSLocalizedString("odC-O3-JSz.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: License plate
      /// 
      /// Locales: th
      static func lisfef2mPlaceholder(_: Void = ()) -> String {
        return NSLocalizedString("LIS-FE-f2m.placeholder", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: License plate
      /// 
      /// Locales: th
      static func mpkY5TqcText(_: Void = ()) -> String {
        return NSLocalizedString("mpk-Y5-Tqc.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: License plate number : %s
      /// 
      /// Locales: th
      static func mb864AXText(_ value1: UnsafePointer<unichar>) -> String {
        return String(format: NSLocalizedString("1Mb-86-4AX.text", tableName: "Main", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// th translation: Menu
      /// 
      /// Locales: th
      static func yy83CLRnText(_: Void = ()) -> String {
        return NSLocalizedString("YY8-3C-lRn.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: NEW CUSTOMER
      /// 
      /// Locales: th
      static func kd45UWzJNormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("Kd4-5U-WzJ.normalTitle", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Name
      /// 
      /// Locales: th
      static func wcY61WcbText(_: Void = ()) -> String {
        return NSLocalizedString("WcY-61-wcb.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Name : %s
      /// 
      /// Locales: th
      static func gThNWAv4Text(_ value1: UnsafePointer<unichar>) -> String {
        return String(format: NSLocalizedString("gTh-nW-av4.text", tableName: "Main", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// th translation: Password
      /// 
      /// Locales: th
      static func gzdGSDAjPlaceholder(_: Void = ()) -> String {
        return NSLocalizedString("gzd-GS-dAj.placeholder", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Phone number
      /// 
      /// Locales: th
      static func bCrTdJgrText(_: Void = ()) -> String {
        return NSLocalizedString("bCr-Td-Jgr.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Phone number
      /// 
      /// Locales: th
      static func wBnYiIYkPlaceholder(_: Void = ()) -> String {
        return NSLocalizedString("WBn-yi-iYk.placeholder", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Phone number : %s
      /// 
      /// Locales: th
      static func nedNH71KText(_ value1: UnsafePointer<unichar>) -> String {
        return String(format: NSLocalizedString("ned-NH-71K.text", tableName: "Main", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// th translation: Please fill in the blank
      /// 
      /// Locales: th
      static func cIZLKGX0Text(_: Void = ()) -> String {
        return NSLocalizedString("cIZ-lK-gX0.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Province
      /// 
      /// Locales: th
      static func kNv2nLQ3Placeholder(_: Void = ()) -> String {
        return NSLocalizedString("KNv-2n-lQ3.placeholder", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Province
      /// 
      /// Locales: th
      static func oHcOlOkBText(_: Void = ()) -> String {
        return NSLocalizedString("oHc-Ol-OkB.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Province : %s
      /// 
      /// Locales: th
      static func dco16WQVText(_ value1: UnsafePointer<unichar>) -> String {
        return String(format: NSLocalizedString("dco-16-WQV.text", tableName: "Main", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// th translation: SEARCH
      /// 
      /// Locales: th
      static func hChQ3EejNormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("hCh-q3-eej.normalTitle", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: SEARCH CUSTOMER
      /// 
      /// Locales: th
      static func gFZThH8BNormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("gFZ-th-H8B.normalTitle", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Surname
      /// 
      /// Locales: th
      static func o136mJqWText(_: Void = ()) -> String {
        return NSLocalizedString("O13-6m-jqW.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Surname
      /// 
      /// Locales: th
      static func qM1Z7x3Placeholder(_: Void = ()) -> String {
        return NSLocalizedString("3qM-1Z-7x3.placeholder", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Surname : %s
      /// 
      /// Locales: th
      static func x8WYnDNdText(_ value1: UnsafePointer<unichar>) -> String {
        return String(format: NSLocalizedString("x8W-yn-DNd.text", tableName: "Main", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// th translation: TireShop
      /// 
      /// Locales: th
      static func dwq5uUFxTitle(_: Void = ()) -> String {
        return NSLocalizedString("dwq-5u-uFx.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: TireShop
      /// 
      /// Locales: th
      static func eYqFM7USText(_: Void = ()) -> String {
        return NSLocalizedString("EYq-fM-7US.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: TireShop
      /// 
      /// Locales: th
      static func gacGBBLqTitle(_: Void = ()) -> String {
        return NSLocalizedString("Gac-GB-BLq.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: Username
      /// 
      /// Locales: th
      static func uMVXQUhnPlaceholder(_: Void = ()) -> String {
        return NSLocalizedString("uMV-xQ-uhn.placeholder", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: name
      /// 
      /// Locales: th
      static func rF7JsxPlaceholder(_: Void = ()) -> String {
        return NSLocalizedString("92r-F7-Jsx.placeholder", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// th translation: ยกเลิก
      /// 
      /// Locales: th
      static func nJiY6FWnNormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("NJi-Y6-FWn.normalTitle", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = LoginViewController
      
      let bundle = R.hostingBundle
      let login = StoryboardViewControllerResource<LoginViewController>(identifier: "Login")
      let mainNavigation = StoryboardViewControllerResource<UIKit.UINavigationController>(identifier: "MainNavigation")
      let name = "Main"
      
      func login(_: Void = ()) -> LoginViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: login)
      }
      
      func mainNavigation(_: Void = ()) -> UIKit.UINavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: mainNavigation)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "ic_exit_to_app_white_36pt") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_exit_to_app_white_36pt' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ic_nika") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_nika' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ic_done_white") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_done_white' is used in storyboard 'Main', but couldn't be loaded.") }
        if _R.storyboard.main().login() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'login' could not be loaded from storyboard 'Main' as 'LoginViewController'.") }
        if _R.storyboard.main().mainNavigation() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'mainNavigation' could not be loaded from storyboard 'Main' as 'UIKit.UINavigationController'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}

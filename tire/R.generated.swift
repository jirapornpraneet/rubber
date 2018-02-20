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
  
  /// This `R.file` struct is generated, and contains static references to 0 files.
  struct file {
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 2 images.
  struct image {
    /// Image `icApple`.
    static let icApple = Rswift.ImageResource(bundle: R.hostingBundle, name: "icApple")
    /// Image `ic_done_white`.
    static let ic_done_white = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_done_white")
    
    /// `UIImage(named: "icApple", bundle: ..., traitCollection: ...)`
    static func icApple(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icApple, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_done_white", bundle: ..., traitCollection: ...)`
    static func ic_done_white(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_done_white, compatibleWith: traitCollection)
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
  
  /// This `R.segue` struct is generated, and contains static references to 1 view controllers.
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
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
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
      typealias InitialController = UIKit.UIViewController
      
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
        if UIKit.UIImage(named: "ic_done_white") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_done_white' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "icApple") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icApple' is used in storyboard 'Main', but couldn't be loaded.") }
        if _R.storyboard.main().login() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'login' could not be loaded from storyboard 'Main' as 'LoginViewController'.") }
        if _R.storyboard.main().mainNavigation() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'mainNavigation' could not be loaded from storyboard 'Main' as 'UIKit.UINavigationController'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}

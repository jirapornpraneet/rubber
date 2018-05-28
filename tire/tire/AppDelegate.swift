//
//  AppDelegate.swift
//  tire
//
//  Created by Jiraporn Praneet on 13/2/2561 BE.
//  Copyright © 2561 Jiraporn Praneet. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import NVActivityIndicatorView
import UserNotifications
import EVReflection
import Firebase
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        IQKeyboardManager.sharedManager().enable = true
        Messaging.messaging().delegate = self
        NVActivityIndicatorView.DEFAULT_TYPE = .ballClipRotateMultiple
        PrintOptions.Active = [.UnknownKeypath,
                               .ShouldExtendNSObject,
                               .IsInvalidJson,
                               .MissingProtocol,
                               .MissingKey,
                               .InvalidType,
                               .InvalidValue,
                               .InvalidClass,
                               .EnumWithoutAssociatedValue]

        if !UserDefaults.loadAccessToken().isEmpty && UserDefaults.loadIsAdmin() {
            self.window?.rootViewController = R.storyboard.main.mainNavigation()
        } else if !UserDefaults.loadAccessToken().isEmpty {
            self.window?.rootViewController = R.storyboard.main.mainNavigetionCustomerView()
        }

        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self

            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        application.registerForRemoteNotifications()
        NotificationCenter.default.addObserver(self, selector: #selector(presentLoginView),
                                               name: NSNotification.Name(rawValue: notificationNamePresentLoginView),
                                               object: nil)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
    }

    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        print(remoteMessage)
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken as Data
    }

    public func application(received remoteMessage: MessagingRemoteMessage) {
        print(remoteMessage)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        // Print full message.
        print("userInfo: \(userInfo)")
        print(userInfo)
    }

    @objc func presentLoginView() {
        UserDefaults.removeAccessToken()
        let vc = R.storyboard.main.login()!
        let window = UIApplication.shared.windows[0] as UIWindow
        UIView.transition(
            from: window.rootViewController!.view,
            to: vc.view,
            duration: 1,
            options: .transitionFlipFromTop,
            completion: { _ in
                window.rootViewController = vc
                UserDefaults.removeAllKey()
        })
    }
}

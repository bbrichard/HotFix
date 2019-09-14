//
//  AppDelegate.swift
//  BuglyHotFixDemo
//
//  Created by Richard on 13/9/2019.
//  Copyright © 2019 a. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        configBugly()

        
//       _ = TTT()
        
        let buglyConfig = BuglyConfig()
        buglyConfig.debugMode = true
        buglyConfig.reportLogLevel = .info
        Bugly.start(withAppId: "4ccbc8b443",config:buglyConfig)
        let path = Bundle.main.path(forResource: "demo", ofType: "js")
        JPEngine.handleException { e in
            print("Exception : %@", e!)
        }
        let jsValue = JPEngine.evaluateScript(withPath: path)
        if jsValue != nil {
            BuglyLog.level(.info, logs: "evaluateScript success")
//           BuglyMender.shared().report(.activeSucess)
        }

        BuglyLog.level(.info, logs: "evaluateScript success")
//        BuglyMender.shared().report(.activeSucess)
        
        let window = UIWindow()
        window.rootViewController = HTViewController()
        window.makeKeyAndVisible()
        return true
    }

    
    private func configBugly() {
        
        let buglyConfig = BuglyConfig()
        buglyConfig.debugMode = true
        buglyConfig.reportLogLevel = .info
        Bugly.start(withAppId: "4ccbc8b443",config:buglyConfig)

        JPEngine.handleException { (msg) in
            let exception = NSException(name: NSExceptionName(rawValue: "Hotfix Exception"), reason: msg, userInfo: nil)
            Bugly.report(exception)
        }

        BuglyMender.shared().checkRemoteConfig { (event:BuglyHotfixEvent, info:[AnyHashable : Any]?) in

            if (event == BuglyHotfixEvent.patchValid || event == BuglyHotfixEvent.newPatch) {
                let patchDirectory = BuglyMender.shared().patchDirectory() as NSString
                let patchFileName = "main.js"
                let patchFilePath = patchDirectory.appendingPathComponent(patchFileName)
                if (FileManager.default.fileExists(atPath: patchFilePath) && JPEngine.evaluateScript(withPath: patchFilePath) != nil) {
                    BuglyLog.level(.info, logs: "evaluateScript success")
                    BuglyMender.shared().report(.activeSucess)
                }else {
                    BuglyLog.level(.error, logs: "evaluateScript fail")
                    BuglyMender.shared().report(.activeFail)
                }
            }
        }
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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


}


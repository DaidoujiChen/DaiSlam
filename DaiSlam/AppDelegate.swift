//
//  AppDelegate.swift
//  DaiSlam
//
//  Created by DaidoujiChen on 2015/11/27.
//  Copyright © 2015年 DaidoujiChen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let slamIcon = UIApplicationShortcutIcon(type: .Play)
        let slamItem = UIMutableApplicationShortcutItem(type: "猛擊", localizedTitle: "遭受猛擊", localizedSubtitle: nil, icon: slamIcon, userInfo: nil)
        application.shortcutItems = [slamItem]
        return true
    }
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        let alert = UIAlertController(title: "Oops!!!!", message: "超~~~痛~~~的~~~", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "痛!", style: .Default, handler: nil))
        self.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
        completionHandler(true)
    }
    
}


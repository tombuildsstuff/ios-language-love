//
//  AppDelegate.swift
//  LanguagePicker
//
//  Created by Tom Harvey on 13/04/2015.
//  Copyright (c) 2015 Tom Harvey. All rights reserved.
//

import UIKit
import LanguagePickerCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let controller = LanguageViewController();
        let navigation = UINavigationController(rootViewController: controller);
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds);
        self.window?.rootViewController = navigation;
        self.window?.makeKeyAndVisible();
        
        return true
    }


}


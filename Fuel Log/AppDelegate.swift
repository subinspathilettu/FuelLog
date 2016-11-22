//
//  AppDelegate.swift
//  Fuel Log
//
//  Created by Subins on 09/11/16.
//  Copyright © 2016 QBurst. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		FuelManager.shared.fetchLogs()
		return true
	}
}


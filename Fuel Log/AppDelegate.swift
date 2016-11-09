//
//  AppDelegate.swift
//  Fuel Log
//
//  Created by Subins on 09/11/16.
//  Copyright © 2016 QBurst. All rights reserved.
//

import UIKit
import Rollout

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		Rollout.setup(withKey:"5822b655174f748f22cf272f")
		FuelManager.shared.fetchLogs()
		return true
	}
}


//
//  TodayViewController.swift
//  Fuel Console
//
//  Created by Subins on 09/11/16.
//  Copyright © 2016 QBurst. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {

	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var distanceLabel: UILabel!
	@IBOutlet weak var mileageLabel: UILabel!

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		updateInterface()
	}

	func updateInterface() {

		let userDefaults = UserDefaults(suiteName: "group.com.qburst.Fuel-Log")
		if let price = userDefaults?.value(forKey: "FuelLogPrice") as? String {
			priceLabel.text = price + " ₹/l"
		}

		if let distance = userDefaults?.value(forKey: "FuelLogDistance") as? String {
			distanceLabel.text = distance + " km"
		}

		if let mileage = userDefaults?.value(forKey: "FuelLogMilege") as? String {
			mileageLabel.text = mileage + " km/l"
		}
	}
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
		
		updateInterface()
        completionHandler(NCUpdateResult.newData)
    }

	func widgetMarginInsets(forProposedMarginInsets defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {

		var margin = defaultMarginInsets
		margin.bottom = 100.0
		return margin
	}
}

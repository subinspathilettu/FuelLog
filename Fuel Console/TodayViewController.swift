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
	
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func updateInterface() {

		priceLabel.text = "72.0 ₹/l"
		distanceLabel.text = "223 km"
		mileageLabel.text = "50.0 km/l"
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

//
//  LogCell.swift
//  Fuel Log
//
//  Created by Subins on 09/11/16.
//  Copyright © 2016 QBurst. All rights reserved.
//

import UIKit

class LogCell: UITableViewCell {

	@IBOutlet weak var distanceLabel: UILabel?
	@IBOutlet weak var mileageLabel: UILabel?
	@IBOutlet weak var priceLabel: UILabel?

	public var fuelLog: FuelLog? {
		didSet {
			if let distance = fuelLog?.distanceInKiloMeter {
				distanceLabel?.text = "\(distance.roundTo(places: 2)) km"
			}

			if let mileage = fuelLog?.mileagePerLitre {
				mileageLabel?.text = "\(mileage.roundTo(places: 2)) km/l"
			}

			if let price = fuelLog?.pricePerLitre {
				priceLabel?.text = "\(price.roundTo(places: 2)) ₹/l"
			}
		}
	}
}

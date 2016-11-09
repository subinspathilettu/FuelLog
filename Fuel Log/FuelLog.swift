//
//  FuelLog.swift
//  Milege
//
//  Created by Subins on 08/11/16.
//  Copyright © 2016 QBurst. All rights reserved.
//

import Foundation
import UIKit

public class FuelLog: NSObject, NSCoding {

	public var odometer: CGFloat = 0.0
	public var quantity: CGFloat = 0.0
	public var amount: CGFloat = 0.0
	var distanceInKiloMeter: CGFloat = 0.0
	var mileagePerLitre: CGFloat = 0.0
	var pricePerLitre: CGFloat = 0.0

	override init() {
		super.init()
	}

	public func encode(with aCoder: NSCoder) {

		aCoder.encode(odometer, forKey:"odometer")
		aCoder.encode(quantity, forKey:"quantity")
		aCoder.encode(amount, forKey:"amount")
		aCoder.encode(distanceInKiloMeter, forKey:"distanceInKiloMeter")
		aCoder.encode(mileagePerLitre, forKey:"mileagePerLitre")
		aCoder.encode(pricePerLitre, forKey:"pricePerLitre")
	}

	required public init(coder aDecoder: NSCoder) {

		super.init()
		odometer = aDecoder.decodeObject(forKey: "odometer") as! CGFloat
		quantity = aDecoder.decodeObject(forKey: "quantity") as! CGFloat
		amount = aDecoder.decodeObject(forKey: "amount") as! CGFloat
		distanceInKiloMeter = aDecoder.decodeObject(forKey: "distanceInKiloMeter") as! CGFloat
		mileagePerLitre = aDecoder.decodeObject(forKey: "mileagePerLitre") as! CGFloat
		pricePerLitre = aDecoder.decodeObject(forKey: "pricePerLitre") as! CGFloat
	}
}

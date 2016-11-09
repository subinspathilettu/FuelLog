//
//  Utils.swift
//  Fuel Log
//
//  Created by Subins on 09/11/16.
//  Copyright © 2016 QBurst. All rights reserved.
//

import UIKit

extension CGFloat {
	/// Rounds the double to decimal places value
	func roundTo(places:Int) -> CGFloat {
		let divisor = pow(10.0, CGFloat(places))
		return (self * divisor).rounded() / divisor
	}
}

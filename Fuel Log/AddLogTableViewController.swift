//
//  AddLogTableViewController.swift
//  Milege
//
//  Created by Subins on 08/11/16.
//  Copyright © 2016 QBurst. All rights reserved.
//

import UIKit

class AddLogTableViewController: UITableViewController {

	@IBOutlet weak var odometerTextField: UITextField?
	@IBOutlet weak var quantityTextField: UITextField?
	@IBOutlet weak var amountTextField: UITextField?
	@IBOutlet weak var actionButton: UIButton?
	public var fuelLog: FuelLog?

	override func viewDidLoad() {
		super.viewDidLoad()

		actionButton?.setTitle("Add", for: .normal)

		if self.fuelLog != nil {
			setLogView(self.fuelLog!)
			actionButton?.setTitle("Update", for: .normal)
		} else if !FuelManager.shared.fuelLogs.isEmpty {
			setLogView(FuelManager.shared.fuelLogs.last!)
		}

		odometerTextField?.becomeFirstResponder()
	}

	func setLogView(_ fuelLog: FuelLog) {

		odometerTextField?.text = String(describing: fuelLog.odometer)
		quantityTextField?.text = String(describing: fuelLog.quantity)
		amountTextField?.text = String(describing: fuelLog.amount)
	}

	@IBAction func save() {

		let log = FuelLog()
		if let value = NumberFormatter().number(from: (odometerTextField?.text)!) {
			let number = CGFloat(value)
			fuelLog == nil ? (log.odometer = number) : (fuelLog?.odometer = number)
		}

		if let value = NumberFormatter().number(from: (quantityTextField?.text)!) {
			let number = CGFloat(value)
			fuelLog == nil ? (log.quantity = number) : (fuelLog?.quantity = number)
		}

		if let value = NumberFormatter().number(from: (amountTextField?.text)!) {
			let number = CGFloat(value)
			fuelLog == nil ? (log.amount = number) : (fuelLog?.amount = number)
		}

		fuelLog == nil ? FuelManager.shared.addLog(log) : FuelManager.shared.updateLog(fuelLog!)

		_ = navigationController?.popViewController(animated: true)
	}
}

//
//  FuelLogTableViewController.swift
//  Milege
//
//  Created by Subins on 08/11/16.
//  Copyright © 2016 QBurst. All rights reserved.
//

import UIKit

class FuelLogTableViewController: UITableViewController {

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		tableView.reloadData()
	}

	override func tableView(_ tableView: UITableView,
	                        numberOfRowsInSection section: Int) -> Int {
		return FuelManager.shared.fuelLogs.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt
		indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "LogCellIdentifier") as? LogCell
		cell?.fuelLog = FuelManager.shared.fuelLogs[indexPath.row]
		return cell!
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		let viewController = storyboard?.instantiateViewController(withIdentifier:
			"AddLogTableViewController") as? AddLogTableViewController
		viewController?.fuelLog = FuelManager.shared.fuelLogs[indexPath.row]
		navigationController?.pushViewController(viewController!, animated: true)
	}

	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {

		return true
	}

	override func tableView(_ tableView: UITableView, editingStyleForRowAt
		indexPath: IndexPath) -> UITableViewCellEditingStyle {

		return .delete
	}

	override func tableView(_ tableView: UITableView, commit
		editingStyle: UITableViewCellEditingStyle,
	                         forRowAt indexPath: IndexPath) {

		if editingStyle == .delete {
			FuelManager.shared.removeLogAt(indexPath.row)
			tableView.reloadData()
		}
	}

	@IBAction func trash() {

		let alertController = UIAlertController(title: "Fuel Logs",
		                                        message: "Are you sure you want to delete all logs?",
		                                        preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .default, handler: { action in

			FuelManager.shared.removeAllLogs()
			self.tableView.reloadData()
		})
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		alertController.addAction(cancelAction)
		alertController.addAction(okAction)
		present(alertController, animated: true, completion: nil)
	}
}

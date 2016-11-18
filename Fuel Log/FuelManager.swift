//
//  FuelManager.swift
//  Milege
//
//  Created by Subins on 08/11/16.
//  Copyright © 2016 QBurst. All rights reserved.
//

import Foundation

public class FuelManager {

	public static let shared = FuelManager()
	public var fuelLogs = [FuelLog]()

	public func addLog(_ log: FuelLog) {

		fuelLogs.insert(log, at: 0)
		processLog(log)
		saveLogs()
	}

	public func updateLog(_ fuelLog: FuelLog) {

		processLog(fuelLog)
		saveLogs()
	}

	public func fetchLogs() {

		let path = getArchivePath()
		if let logs: [FuelLog] = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? [FuelLog] {
			fuelLogs = logs
		}
	}

	public func removeAllLogs() {

		fuelLogs.removeAll()
		saveLogs()
	}

	func processLog(_ log: FuelLog) {

		let index = fuelLogs.index(of: log)

		if index! < (fuelLogs.count - 1) {

			let previousLog = fuelLogs[index! + 1]

			log.distanceInKiloMeter = log.odometer - previousLog.odometer
			log.mileagePerLitre = log.distanceInKiloMeter / previousLog.quantity
		}

		log.pricePerLitre = log.amount / log.quantity
	}

	func getArchivePath() -> String {

		let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
		                                                FileManager.SearchPathDomainMask.allDomainsMask,
		                                                true)
		let path: AnyObject = paths[0] as AnyObject
		return path.appending("/array.plist")
	}

	func saveLogs() {

		if !fuelLogs.isEmpty {
			let log = fuelLogs.first
			let userDefaults = UserDefaults(suiteName: "group.com.qburst.Fuel-Log")

			if let mileage = log?.mileagePerLitre {
				userDefaults?.set(String(describing: mileage.roundTo(places: 2)),
				                  forKey: "FuelLogMilege")
			}

			if let price = log?.pricePerLitre {
				userDefaults?.set(String(describing: price.roundTo(places: 2)),
				                  forKey: "FuelLogPrice")
			}

			if let distance = log?.distanceInKiloMeter {
				userDefaults?.set(String(describing: distance.roundTo(places: 2)),
				                  forKey: "FuelLogDistance")
			}
		}

		let path = getArchivePath()
		NSKeyedArchiver.archiveRootObject(fuelLogs,
		                                  toFile: path)
	}
}

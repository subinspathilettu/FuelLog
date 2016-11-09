//
//  FuelManager.swift
//  Milege
//
//  Created by Subins on 08/11/16.
//  Copyright © 2016 QBurst. All rights reserved.
//

import Foundation

class FuelManager {

	public static let shared = FuelManager()
	public var fuelLogs = [FuelLog]()

	public func addLog(_ log: FuelLog) {

		fuelLogs.insert(log, at: 0)
		saveLogs()
	}

	public func updateLog(_ fuelLog: FuelLog) {

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

	func getArchivePath() -> String {

		let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
		                                                FileManager.SearchPathDomainMask.allDomainsMask,
		                                                true)
		let path: AnyObject = paths[0] as AnyObject
		return path.appending("/array.plist")
	}

	func saveLogs() {

		let path = getArchivePath()
		NSKeyedArchiver.archiveRootObject(fuelLogs,
		                                  toFile: path)
	}
}

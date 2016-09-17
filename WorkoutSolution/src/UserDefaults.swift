//
//  UserDefaults.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 9/10/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import Foundation

class UserDefaults {

	func GetBool(_ key: String) -> Bool {
		let defaults = Foundation.UserDefaults.standard
		return defaults.bool(forKey: key)
	}

	func SetBool(_ key: String, value: Bool) {
		let defaults = Foundation.UserDefaults.standard
		defaults.set(value, forKey: key)
	}

	func GetString(_ key: String) -> String {
		let defaults = Foundation.UserDefaults.standard
		if defaults.object(forKey: key) != nil {
			let result = defaults.object(forKey: key)
			return result as! String
		} else {
			return ""
		}
	}

	func SetString(_ key: String, value: String) {
		let defaults = Foundation.UserDefaults.standard
		defaults.set(value, forKey: key)
	}
}

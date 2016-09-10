//
//  UserDefaults.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 9/10/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import Foundation

class UserDefaults {

	func GetBool(key: String) -> Bool {
		let defaults = NSUserDefaults.standardUserDefaults()
		return defaults.boolForKey(key)
	}

	func SetBool(key: String, value: Bool) {
		let defaults = NSUserDefaults.standardUserDefaults()
		defaults.setBool(value, forKey: key)
	}

	func GetString(key: String) -> String {
		let defaults = NSUserDefaults.standardUserDefaults()
		if defaults.objectForKey(key) != nil {
			return (defaults.objectForKey(key)?.description)!
		} else {
			return ""
		}
	}

	func SetString(key: String, value: String) {
		let defaults = NSUserDefaults.standardUserDefaults()
		defaults.setObject(value, forKey: key)
	}
}
//
//  UserDefaults.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 9/10/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import Foundation

class UserDefaults {

	func GetInt(_ key: String) -> Int {
		let defaults = Foundation.UserDefaults.standard
		if defaults.object(forKey: key) != nil {
			return defaults.object(forKey: key) as! Int
		} else {
			return 0
		}
	}

	func SetInt(_ key: String, value: Int) {
		let defaults = Foundation.UserDefaults.standard
		defaults.set(value, forKey: key)
	}

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
			return defaults.object(forKey: key) as! String
		} else {
			return ""
		}
	}

	func SetString(_ key: String, value: String) {
		let defaults = Foundation.UserDefaults.standard
		defaults.set(value, forKey: key)
	}

	func GetArrayInt(_ key: String) -> [Int] {
		let defaults = Foundation.UserDefaults.standard
		if defaults.object(forKey: key) != nil {
			return defaults.object(forKey: key) as! [Int]
		} else {
			return [0]
		}
	}

	func SetArrayInt(_ key: String, value: [Int]) {
		let defaults = Foundation.UserDefaults.standard
		defaults.set(value, forKey: key)
	}

	func GetArrayString(_ key: String) -> [String] {
		let defaults = Foundation.UserDefaults.standard
		if defaults.object(forKey: key) != nil {
			return defaults.object(forKey: key) as! [String]
		} else {
			return [""]
		}
	}

	func SetArrayString(_ key: String, value: [String]) {
		let defaults = Foundation.UserDefaults.standard
		defaults.set(value, forKey: key)
	}
}

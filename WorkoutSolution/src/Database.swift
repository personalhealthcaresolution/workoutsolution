//
//  Database.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 9/14/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import Foundation

class Database {
	init() {
		let userDefaults = UserDefaults()
		userDefaults.SetString("LowerWorkoutIcon1", value: "list")
		userDefaults.SetString("UpperWorkoutIcon1", value: "list")
		userDefaults.SetString("CoreAbsWorkoutIcon1", value: "list")

		userDefaults.SetString("LowerWorkoutText1", value: "Home Workout")
		userDefaults.SetString("UpperWorkoutText1", value: "Full Body Workout")
		userDefaults.SetString("CoreAbsWorkoutText1", value: "Complete Arm Workout")
	}
}
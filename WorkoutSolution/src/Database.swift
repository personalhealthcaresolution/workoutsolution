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
		/////////////////////////////////////////////////////////////////////
		userDefaults.SetString("UpperWorkoutIcon1", value: "chinups")
		userDefaults.SetString("UpperWorkoutText1", value: "CHINUPS")
		userDefaults.SetString("UpperWorkoutList1", value: "list")

		userDefaults.SetString("UpperWorkoutIcon2", value: "wallSix")
		userDefaults.SetString("UpperWorkoutText2", value: "WALL SIX")
		userDefaults.SetString("UpperWorkoutList2", value: "list")
		/////////////////////////////////////////////////////////////////////
		userDefaults.SetString("LowerWorkoutIcon1", value: "dipOnChair")
		userDefaults.SetString("LowerWorkoutText1", value: "Dip On Chair")
		userDefaults.SetString("LowerWorkoutList1", value: "list")

		userDefaults.SetString("LowerWorkoutIcon2", value: "squats")
		userDefaults.SetString("LowerWorkoutText2", value: "SQUATS")
		userDefaults.SetString("LowerWorkoutList2", value: "list")
		/////////////////////////////////////////////////////////////////////
		userDefaults.SetString("CoreAbsWorkoutIcon1", value: "pushUp")
		userDefaults.SetString("CoreAbsWorkoutText1", value: "PUSH UP")
		userDefaults.SetString("CoreAbsWorkoutList1", value: "list")
		/////////////////////////////////////////////////////////////////////
		userDefaults.SetString("BeginnerWorkoutIcon1", value: "chinups")
		userDefaults.SetString("BeginnerWorkoutText1", value: "CHINUPS")
		userDefaults.SetString("BeginnerWorkoutList1", value: "list")
		/////////////////////////////////////////////////////////////////////
		userDefaults.SetString("IntermediateWorkoutIcon1", value: "wallSix")
		userDefaults.SetString("IntermediateWorkoutText1", value: "WALL SIX")
		userDefaults.SetString("IntermediateWorkoutList1", value: "list")
		/////////////////////////////////////////////////////////////////////
		userDefaults.SetString("AdvancedWorkoutIcon1", value: "dipOnChair")
		userDefaults.SetString("AdvancedWorkoutText1", value: "Dip On Chair")
		userDefaults.SetString("AdvancedWorkoutList1", value: "list")
		/////////////////////////////////////////////////////////////////////
		userDefaults.SetString("ExpertWorkoutIcon1", value: "squats")
		userDefaults.SetString("ExpertWorkoutText1", value: "SQUATS")
		userDefaults.SetString("ExpertWorkoutList1", value: "list")

		userDefaults.SetString("ExpertWorkoutIcon2", value: "pushUp")
		userDefaults.SetString("ExpertWorkoutText2", value: "PUSH UP")
		userDefaults.SetString("ExpertWorkoutList2", value: "list")
	}
}

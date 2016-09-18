//
//  Application.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 9/13/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import Foundation

class Application {
	static let instance = Application()

	enum FooterTab {
		case exercises
		case workouts
		case tracker
		case settings
	}

	var currentTab: FooterTab = FooterTab.workouts
	func CurrentTab() -> FooterTab { return currentTab }
	func CurrentTab(_ value: FooterTab) { currentTab = value }

	enum Workouts {
		case type
		case level
	}

	var currentWorkout: Workouts = Workouts.type
	func CurrentWorkout() -> Workouts { return currentWorkout }
	func CurrentWorkout(_ value: Workouts) { currentWorkout = value }

	enum WorkoutsType {
		case upper
		case lower
		case coreAbs
	}

	var currentWorkoutType: WorkoutsType = WorkoutsType.upper
	func CurrentWorkoutType() -> WorkoutsType { return currentWorkoutType }
	func CurrentWorkoutType(_ value: WorkoutsType) { currentWorkoutType = value }

	enum WorkoutsLevel {
		case beginner
		case intermediate
		case advanced
		case expert
	}

	var currentWorkoutLevel: WorkoutsLevel = WorkoutsLevel.beginner
	func CurrentWorkoutLevel() -> WorkoutsLevel { return currentWorkoutLevel }
	func CurrentWorkoutLevel(_ value: WorkoutsLevel) { currentWorkoutLevel = value }
}

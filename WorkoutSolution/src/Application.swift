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

	func CurrentTab() -> FooterTab {
		return currentTab
	}

	func CurrentTab(_ value: FooterTab) {
		currentTab = value
	}

	func TabString() -> String {
		switch CurrentTab() {
		case FooterTab.exercises:
			return "Exercises"
		case FooterTab.workouts:
			return "Workouts"
		case FooterTab.tracker:
			return "Tracker"
		case FooterTab.settings:
			return "Settings"
		}
	}

	enum WorkoutsList {
		case upper
		case lower
		case core_ABS
	}

	var currentWorkout: WorkoutsList = WorkoutsList.upper

	func CurrentWorkout() -> WorkoutsList {
		return currentWorkout
	}

	func CurrentWorkout(_ value: WorkoutsList) {
		currentWorkout = value
	}
}

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
		case EXERCISES
		case WORKOUTS
		case TRACKER
		case SETTINGS
	}

	var currentTab: FooterTab = FooterTab.WORKOUTS

	func CurrentTab() -> FooterTab {
		return currentTab
	}

	func CurrentTab(value: FooterTab) {
		currentTab = value
	}

	func TabString() -> String {
		switch CurrentTab() {
		case FooterTab.EXERCISES:
			return "Exercises"
		case FooterTab.WORKOUTS:
			return "Workouts"
		case FooterTab.TRACKER:
			return "Tracker"
		case FooterTab.SETTINGS:
			return "Settings"
		}
	}

	enum WorkoutsList {
		case UPPER
		case LOWER
		case CORE_ABS
	}

	var currentWorkout: WorkoutsList = WorkoutsList.UPPER

	func CurrentWorkout() -> WorkoutsList {
		return currentWorkout
	}

	func CurrentWorkout(value: WorkoutsList) {
		currentWorkout = value
	}
}
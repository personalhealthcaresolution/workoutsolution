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

	enum Workouts {
		case type
		case level
	}

	enum WorkoutsType {
		case upper
		case lower
		case coreAbs
	}

	enum WorkoutsLevel {
		case beginner
		case intermediate
		case advanced
		case expert
	}

	enum ExercisesView {
		case type
		case level
		case details
	}

	var currentWorkout: Workouts = Workouts.type
	func CurrentWorkout() -> Workouts { return currentWorkout }
	func CurrentWorkout(_ value: Workouts) { currentWorkout = value }

	var currentWorkoutType: WorkoutsType = WorkoutsType.upper
	func CurrentWorkoutType() -> WorkoutsType { return currentWorkoutType }
	func CurrentWorkoutType(_ value: WorkoutsType) { currentWorkoutType = value }

	var currentWorkoutLevel: WorkoutsLevel = WorkoutsLevel.beginner
	func CurrentWorkoutLevel() -> WorkoutsLevel { return currentWorkoutLevel }
	func CurrentWorkoutLevel(_ value: WorkoutsLevel) { currentWorkoutLevel = value }

	var currentExercisesView: ExercisesView = ExercisesView.type
	func CurrentExercisesView() -> ExercisesView { return currentExercisesView }
	func CurrentExercisesView(_ value: ExercisesView) { currentExercisesView = value }
}

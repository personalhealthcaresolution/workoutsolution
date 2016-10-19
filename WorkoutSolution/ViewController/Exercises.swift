//
//  Exercises.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 10/19/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Exercises: UIViewController {
	let screenObject = ScreenObject()

    override func viewDidLoad() {
        super.viewDidLoad()

		ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
		ScreenSize.setCurrentWidth(self.view.frame.size.width)
		ScreenSize.setCurrentHeight(self.view.frame.size.height)

		initView()
		Application.instance.CurrentWorkoutsView(Application.WorkoutsView.exercises)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

	func initView() {
		screenObject.ParseXML("Exercises")
		screenObject.ParseXML("Footer")

		var objects = screenObject.GetObjects()
		while objects.count > 0 {
			var object = ScreenObject.Object()
			object = objects.first!
			screenObject.DrawObject(self, object: object)
			objects.removeFirst()
		}
	}

	func btnBackClicked(_ sender:UIButton!) {
		self.performSegue(withIdentifier: "showWorkoutsList", sender: self)
	}

	func btnExercisesClicked(_ sender:UIButton) {
		switch Application.instance.currentExercisesView {
		case Application.ExercisesView.type:
			self.performSegue(withIdentifier: "showType", sender: self)
		case Application.ExercisesView.level:
			self.performSegue(withIdentifier: "showLevel", sender: self)
		case Application.ExercisesView.details:
			self.performSegue(withIdentifier: "showDetails", sender: self)
		case Application.ExercisesView.workouts:
			self.performSegue(withIdentifier: "showWorkouts", sender: self)
		}
	}

	func btnWorkoutsClicked(_ sender:UIButton) {
	}

	func btnTrackerClicked(_ sender:UIButton) {
	}

	func btnSettingClicked(_ sender:UIButton) {
	}
}

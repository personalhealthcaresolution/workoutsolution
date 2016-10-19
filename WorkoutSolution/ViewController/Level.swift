//
//  Level.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 6/8/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Level: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
        ScreenSize.setCurrentWidth(self.view.frame.size.width)
        ScreenSize.setCurrentHeight(self.view.frame.size.height)
        initView()

		Application.instance.CurrentWorkout(Application.Workouts.level)
		Application.instance.CurrentExercisesView(Application.ExercisesView.level)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let swap = ScreenSize.getCurrentWidth()
        ScreenSize.setCurrentWidth(ScreenSize.getCurrentHeight())
        ScreenSize.setCurrentHeight(swap)
        //initView()
    }

    func initView() {
        let screenObject = ScreenObject()
		screenObject.ParseXML("Level")
		screenObject.ParseXML("Footer")
        screenObject.DrawScreen(self)
    }

	func btnBackClicked(_ sender:UIButton!) {
		self.performSegue(withIdentifier: "showMain", sender: self)
	}

	func btnAbsBeginnerClicked(_ sender:UIButton!) {
		Application.instance.CurrentWorkoutLevel(Application.WorkoutsLevel.beginner)
		self.performSegue(withIdentifier: "showWorkouts", sender: self)
	}

	func btnBeginnerClicked(_ sender:UIButton!) {
		Application.instance.CurrentWorkoutLevel(Application.WorkoutsLevel.intermediate)
		self.performSegue(withIdentifier: "showWorkouts", sender: self)
	}

	func btnAdvancedClicked(_ sender:UIButton!) {
		Application.instance.CurrentWorkoutLevel(Application.WorkoutsLevel.advanced)
		self.performSegue(withIdentifier: "showWorkouts", sender: self)
	}

	func btnIntermediateClicked(_ sender:UIButton!) {
		Application.instance.CurrentWorkoutLevel(Application.WorkoutsLevel.expert)
		self.performSegue(withIdentifier: "showWorkouts", sender: self)
	}

	func btnExercisesClicked(_ sender:UIButton) {
	}

	func btnWorkoutsClicked(_ sender:UIButton) {
		switch Application.instance.CurrentWorkoutsView() {
		case Application.WorkoutsView.workouts:
			self.performSegue(withIdentifier: "showWorkoutsList", sender: self)
		case Application.WorkoutsView.exercises:
			self.performSegue(withIdentifier: "showExercises", sender: self)
		}
	}

	func btnTrackerClicked(_ sender:UIButton) {
	}

	func btnSettingClicked(_ sender:UIButton) {
	}
}

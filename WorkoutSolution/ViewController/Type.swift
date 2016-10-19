//
//  Type.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 5/16/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Type: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
        ScreenSize.setCurrentWidth(self.view.frame.size.width)
        ScreenSize.setCurrentHeight(self.view.frame.size.height)
        initView()

		Application.instance.CurrentWorkout(Application.Workouts.type)
		Application.instance.CurrentExercisesView(Application.ExercisesView.type)
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
		screenObject.ParseXML("Type")
		screenObject.ParseXML("Footer")
        screenObject.DrawScreen(self)
    }

    func btnBackClicked(_ sender:UIButton!) {
        self.performSegue(withIdentifier: "showMain", sender: self)
    }

    func btnUpperClicked(_ sender:UIButton!) {
		Application.instance.CurrentWorkoutType(Application.WorkoutsType.upper)
        self.performSegue(withIdentifier: "showWorkouts", sender: self)
    }

    func btnLowerClicked(_ sender:UIButton!) {
		Application.instance.CurrentWorkoutType(Application.WorkoutsType.lower)
        self.performSegue(withIdentifier: "showWorkouts", sender: self)
    }

    func btnCoreAbsClicked(_ sender:UIButton!) {
		Application.instance.CurrentWorkoutType(Application.WorkoutsType.coreAbs)
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

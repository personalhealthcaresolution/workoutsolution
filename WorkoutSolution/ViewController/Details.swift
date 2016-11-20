//
//  Details.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/24/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Details: UIViewController {
	let backButton = BackButton()
	let routineButton = RoutineButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
        ScreenSize.setCurrentWidth(self.view.frame.size.width)
        ScreenSize.setCurrentHeight(self.view.frame.size.height)
        initView()

		//Application.instance.CurrentExercisesView(Application.ExercisesView.details)
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
        screenObject.ParseXML("Details")
        screenObject.ParseXML("Footer")
        
        var objects = screenObject.GetObjects()
        while objects.count > 0 {
            var object = ScreenObject.Object()
            object = objects.first!
            screenObject.DrawObject(self, object: object)
            objects.removeFirst()
        }

		screenObject.AddBackButton(backButton, view: self, xPosition: 70, yPosition: 93, width: 400, height: 120, title: "Back", icon: "back", selector: #selector(btnBackClicked(_:)))
		screenObject.AddRoutineButton(routineButton, view: self, xPosition: 259, yPosition: 1830, width: 724, height: 149, selector: #selector(btnStartClicked(_:)))
    }

    func btnBackClicked(_ sender:UIButton!) {
		backButton.Touched()
        switch Application.instance.CurrentTab() {
        case Application.Tabs.workouts:
            self.performSegue(withIdentifier: "showExercises", sender: self)
        case Application.Tabs.exercises:
            self.performSegue(withIdentifier: "showWorkouts", sender: self)
		default: break
        }
    }

    func btnStartClicked(_ sender:UIButton!) {
		routineButton.Touched()
        let ourApplication = UIApplication.shared
        let URLEncodedText = "test"
        let ourPath = "timer://" + URLEncodedText
        let ourURL = NSURL(string: ourPath)
        if ourApplication.canOpenURL(ourURL as! URL) {
            ourApplication.openURL(ourURL as! URL)
        }
    }

    func btnExercisesClicked(_ sender:UIButton) {
		switch Application.instance.CurrentTab() {
		case Application.Tabs.workouts:
			switch Application.instance.CurrentWorkout() {
			case Application.Workouts.type:
				self.performSegue(withIdentifier: "showType", sender: self)
			case Application.Workouts.level:
				self.performSegue(withIdentifier: "showLevel", sender: self)
			default:
				self.performSegue(withIdentifier: "showType", sender: self)
			}
		case Application.Tabs.settings: break
		case Application.Tabs.exercises: break
		}
    }

	func btnWorkoutsClicked(_ sender:UIButton) {
		switch Application.instance.CurrentTab() {
		case Application.Tabs.workouts: break
		case Application.Tabs.settings: break
		case Application.Tabs.exercises:
			self.performSegue(withIdentifier: "showWorkoutsList", sender: self)
		}
	}


	func btnTrackerClicked(_ sender:UIButton) {}

    func btnSettingsClicked(_ sender:UIButton) {
        self.performSegue(withIdentifier: "showSettings", sender: self)
        
    }
}

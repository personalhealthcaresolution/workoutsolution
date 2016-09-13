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

        ScreenSize.setStatusHeight(UIApplication.sharedApplication().statusBarFrame.size.height)
        ScreenSize.setCurrentWidth(self.view.frame.size.width)
        ScreenSize.setCurrentHeight(self.view.frame.size.height)
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
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

    func btnBackClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showMain", sender: self)
    }

    func btnUpperClicked(sender:UIButton!) {
		Application.instance.CurrentTab(Application.FooterTab.WORKOUTS)
		Application.instance.CurrentWorkout(Application.WorkoutsList.UPPER)
        self.performSegueWithIdentifier("showWorkout", sender: self)
    }

    func btnLowerClicked(sender:UIButton!) {
		Application.instance.CurrentTab(Application.FooterTab.WORKOUTS)
		Application.instance.CurrentWorkout(Application.WorkoutsList.LOWER)
        self.performSegueWithIdentifier("showWorkout", sender: self)
    }

    func btnCoreAbsClicked(sender:UIButton!) {
		Application.instance.CurrentTab(Application.FooterTab.WORKOUTS)
		Application.instance.CurrentWorkout(Application.WorkoutsList.CORE_ABS)
        self.performSegueWithIdentifier("showWorkout", sender: self)
    }

	func btnExercisesClicked(sender:UIButton) {
		if Application.instance.CurrentTab() != Application.FooterTab.EXERCISES {
			Application.instance.CurrentTab(Application.FooterTab.EXERCISES)
			self.performSegueWithIdentifier("showWorkout", sender: self)
		}
	}

	func btnWorkoutsClicked(sender:UIButton) {
		if Application.instance.CurrentTab() != Application.FooterTab.WORKOUTS {
			Application.instance.CurrentTab(Application.FooterTab.WORKOUTS)
			self.performSegueWithIdentifier("showWorkout", sender: self)
		}
	}

	func btnTrackerClicked(sender:UIButton) {
		if Application.instance.CurrentTab() != Application.FooterTab.TRACKER {
			Application.instance.CurrentTab(Application.FooterTab.TRACKER)
			self.performSegueWithIdentifier("showWorkout", sender: self)
		}
	}

	func btnSettingClicked(sender:UIButton) {
		if Application.instance.CurrentTab() != Application.FooterTab.SETTINGS {
			Application.instance.CurrentTab(Application.FooterTab.SETTINGS)
			self.performSegueWithIdentifier("showWorkout", sender: self)
		}
	}
}
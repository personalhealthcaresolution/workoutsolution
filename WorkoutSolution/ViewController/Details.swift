//
//  Details.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/24/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Details: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
        ScreenSize.setCurrentWidth(self.view.frame.size.width)
        ScreenSize.setCurrentHeight(self.view.frame.size.height)
        initView()

		Application.instance.CurrentExercisesView(Application.ExercisesView.details)
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
        let constant = Constant()
        let screenObject = ScreenObject()

        screenObject.AddBackground(self.view, xPosition: 0, yPosition: 83, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: constant.citrus)
        screenObject.AddButton(self, xPosition: 70, yPosition: 100, width: 120, height: 120, icon: "back", selector: #selector(Details.btnBackClicked(_:)))

        screenObject.AddBackground(self.view, xPosition: 0, yPosition: 223, width: ScreenSize.defaultWidth, height: 709, color: constant.coralRed)

        screenObject.AddImage(self.view, xPosition: 76, yPosition: 386, width: 385, height: 400, named: "before")
        screenObject.AddLabel(self.view, xPosition: 93, yPosition: 829, width: 350, height: 57, text: "BEFORE", font: constant.helveticaNeueBold, size: 22, color: constant.citrus)

        screenObject.AddImage(self.view, xPosition: 536, yPosition: 273, width: 630, height: 510, named: "behind")
        screenObject.AddLabel(self.view, xPosition: 685, yPosition: 829, width: 332, height: 57, text: "BEHIND", font: constant.helveticaNeueBold, size: 22, color: constant.citrus)

        screenObject.AddBackground(self.view, xPosition: 0, yPosition: 1813, width: ScreenSize.defaultWidth, height: 255, color: constant.coralRed)
        screenObject.AddButton(self, xPosition: 260, yPosition: 1866, width: 722, height: 149, background: "button", title: "START ROUTINE", titleColor: Constant().citrus)

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
		self.performSegue(withIdentifier: "showWorkouts", sender: self)
    }

	func btnWorkoutsClicked(_ sender:UIButton) {
		switch Application.instance.CurrentWorkoutsView() {
		case Application.WorkoutsView.workouts:
			self.performSegue(withIdentifier: "showWorkoutsList", sender: self)
		case Application.WorkoutsView.exercises:
			self.performSegue(withIdentifier: "showExercises", sender: self)
		}
	}

    func btnSettingsClicked(_ sender:UIButton) {
        self.performSegue(withIdentifier: "showSettings", sender: self)
        
    }
}

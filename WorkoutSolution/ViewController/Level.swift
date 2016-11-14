//
//  Level.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 6/8/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Level: UIViewController, UITableViewDelegate, UITableViewDataSource {
	let constant = Constant()
	var tableView = UITableView()
	var workoutName = ["UPPER BODY", "LOWER BODY", "CORE ABS"]
	var workoutIcon = ["upper", "lower", "coreAbs"]

    override func viewDidLoad() {
        super.viewDidLoad()

        ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
        ScreenSize.setCurrentWidth(self.view.frame.size.width)
        ScreenSize.setCurrentHeight(self.view.frame.size.height)

        Application.instance.CurrentTab(Application.Tabs.exercises)
        Application.instance.CurrentWorkout(Application.Workouts.level)
        Application.instance.CurrentExercisesView(Application.ExercisesView.level)
        initView()
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
		var objects = screenObject.GetObjects()
		while objects.count > 0 {
			var object = ScreenObject.Object()
			object = objects.first!
			if (object.type == "table") {
				AddTableView(object)
			} else {
				screenObject.DrawObject(self, object: object)
			}
			objects.removeFirst()
		}
    }

	func AddTableView(_ object: ScreenObject.Object) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: object.xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: object.yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: object.width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.height)

		tableView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(LevelCell.self, forCellReuseIdentifier: "cell")
		tableView.layoutMargins = UIEdgeInsets.zero
		tableView.separatorInset = UIEdgeInsets.zero
		tableView.separatorColor = constant.UIColorFromHex(constant.citrus)
		tableView.backgroundColor = constant.UIColorFromHex(object.color)

		tableView.rowHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.rowHeight)
		self.view.addSubview(tableView)
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

	func btnSettingsClicked(_ sender:UIButton) {
        self.performSegue(withIdentifier: "showSettings", sender: self)

	}

	//tableview delegate
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:LevelCell! = tableView.dequeueReusableCell(withIdentifier: "cell") as! LevelCell
		return cell
	}
}

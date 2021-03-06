//
//  Workouts.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 10/18/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Workouts: UIViewController, UITableViewDelegate, UITableViewDataSource {
	let backButton = BackButton()
	let titleHeader = UILabel()

	let tableView = UITableView()
	let screenObject = ScreenObject()

	var workoutName = [String]()
	var workoutIcon = [String]()
	var workoutIndex = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()

		ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
		ScreenSize.setCurrentWidth(self.view.frame.size.width)
		ScreenSize.setCurrentHeight(self.view.frame.size.height)

		var search = ""
		let workouts = Application.instance.GetWorkouts()

		switch Application.instance.CurrentWorkout() {
		case Application.Workouts.type:
			switch Application.instance.CurrentWorkoutType() {
			case Application.WorkoutsType.lower:
				search = "LowerBody"
			case Application.WorkoutsType.upper:
				search = "UpperBody"
			case Application.WorkoutsType.coreAbs:
				search = "CoreABS"
			}
			var index = 0
			for workout in workouts {
				if workout.type == search {
					workoutName.append(workout.name)
					workoutIcon.append(workout.icon)
					workoutIndex.append(index)
				}
				index = index + 1
			}
		case Application.Workouts.level:
			switch Application.instance.CurrentWorkoutLevel() {
			case Application.WorkoutsLevel.advanced:
				search = "Advanced"
			case Application.WorkoutsLevel.beginner:
				search = "Beginner"
			case Application.WorkoutsLevel.expert:
				search = "Expert"
			case Application.WorkoutsLevel.intermediate:
				search = "Intermediate"
			}
			var index = 0
			for workout in workouts {
				if workout.level == search {
					workoutName.append(workout.name)
					workoutIcon.append(workout.icon)
					workoutIndex.append(index)
				}
				index = index + 1
			}
		default: break
		}

        Application.instance.CurrentTab(Application.Tabs.exercises)
        Application.instance.CurrentExercisesView(Application.ExercisesView.workouts)
		initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func initView() {
		screenObject.ParseXML("Workouts")
		screenObject.ParseXML("Footer")

		var objects = screenObject.GetObjects()
		while objects.count > 0 {
			var object = ScreenObject.Object()
			object = objects.first!
			screenObject.DrawObject(self, object: object)
			objects.removeFirst()
		}

		var title = ""
		switch Application.instance.CurrentWorkout() {
		case Application.Workouts.type:
			title = "Type"
		case Application.Workouts.level:
			title = "Level"
		default:
			title = "Type"
		}

		screenObject.AddBackButton(backButton, view: self, xPosition: 70, yPosition: 93, width: 400, height: 120, title: title, icon: "back", selector: #selector(btnBackClicked(_:)))
		backButton.title.sizeToFit()
		AddTableView(xPosition: 0, yPosition: 223, width: ScreenSize.defaultWidth, height: 1777)
	}

	func AddTableView(xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat) {
        let constant = Constant()
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		tableView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(WorkoutCell.self, forCellReuseIdentifier: "cell")
		tableView.layoutMargins = UIEdgeInsets.zero
		tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorColor = constant.UIColorFromHex(constant.citrus)
        tableView.backgroundColor = constant.UIColorFromHex(constant.coralRed)
		tableView.rowHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: 339)
		self.view.addSubview(tableView)
	}

	func btnBackClicked(_ sender:UIButton!) {
		backButton.Touched()
		switch Application.instance.CurrentWorkout() {
		case Application.Workouts.type:
			self.performSegue(withIdentifier: "showType", sender: self)
		case Application.Workouts.level:
			self.performSegue(withIdentifier: "showLevel", sender: self)
		default:
			self.performSegue(withIdentifier: "showType", sender: self)
		}
	}

	func btnDetailsClicked(_ sender: UIButton!) {
		self.performSegue(withIdentifier: "showDetails", sender: self)
	}

	func btnExercisesClicked(_ sender: UIButton) {
	}

	func btnWorkoutsClicked(_ sender: UIButton) {
		switch Application.instance.CurrentWorkoutsView() {
		case Application.WorkoutsView.workouts:
			self.performSegue(withIdentifier: "showWorkoutsList", sender: self)
		case Application.WorkoutsView.exercises:
			self.performSegue(withIdentifier: "showExercises", sender: self)
		}
	}

	func btnTrackerClicked(_ sender: UIButton) {
	}

    func btnSettingsClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showSettings", sender: self)
        
    }

	func btnTableViewCellClicked(_ workoutIndex: Int) {
		let defaults = UserDefaults()
		defaults.SetInt("workoutIndex", value: workoutIndex)
		self.performSegue(withIdentifier: "showDetails", sender: self)
	}

	//tableview delegate
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		btnTableViewCellClicked(workoutIndex[indexPath.row])
	}

	func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		return false
	}

	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return false
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return workoutName.count
	}

	func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
		return true
	}

	func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
		return true
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:WorkoutCell! = tableView.dequeueReusableCell(withIdentifier: "cell") as! WorkoutCell
		cell.SetIcon(workoutIcon[indexPath.row])
		cell.SetText(workoutName[indexPath.row])
		cell.SetIndex(workoutIndex[indexPath.row])
		cell.initView()
		return cell
	}
}

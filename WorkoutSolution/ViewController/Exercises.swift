//
//  Exercises.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 10/19/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Exercises: UIViewController, UITableViewDelegate, UITableViewDataSource {
	let backButton = BackButton()

	let constant = Constant()
	var tableView = UITableView()
	let screenObject = ScreenObject()
	var exercisesName = [String]()

	let homeName = ["CHINUPS", "WALL SIX"]
	let completeArmName = ["DIP ON CHAIR", "SQUATS"]
	let fullBodyName = ["PUSH UP"]
	let fullExercisesName = ["CHINUPS", "WALL SIX", "DIP ON CHAIR", "SQUATS", "PUSH UP"]

	var isAdding = false
	let defaults = UserDefaults()
	var currentWorkoutName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

		ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
		ScreenSize.setCurrentWidth(self.view.frame.size.width)
		ScreenSize.setCurrentHeight(self.view.frame.size.height)

		let workoutListName = defaults.GetArrayString("workoutListName")
		let workoutListIndex = Application.instance.CurrentWorkoutsListIndex()
		currentWorkoutName = workoutListName[workoutListIndex]
		if (defaults.GetArrayString(currentWorkoutName) == [""]) {
			switch currentWorkoutName {
			case "Home Workout":
				exercisesName = homeName
			case "Complete Arm Workout":
				exercisesName = completeArmName
			case "Full Body Workout":
				exercisesName = fullBodyName
			default:
				exercisesName = homeName
			}
			defaults.SetArrayString(currentWorkoutName, value: exercisesName)
		} else {
			exercisesName = defaults.GetArrayString(currentWorkoutName)
		}

        Application.instance.CurrentTab(Application.Tabs.workouts)
        Application.instance.CurrentWorkoutsView(Application.WorkoutsView.exercises)
		initView()
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

			if (object.type == "table") {
				AddTableView(object)
			} else {
				screenObject.DrawObject(self, object: object)
			}
			objects.removeFirst()
		}
		screenObject.AddBackButton(backButton, view: self, xPosition: 70, yPosition: 93, width: 400, height: 120, title: "Back", icon: "back", selector: #selector(btnBackClicked(_:)))
	}

	func FindExerciseIcon(_ exerciseName: String) -> String {
		switch exerciseName {
		case "CHINUPS":
			return "chinups"
		case "WALL SIX":
			return "wallSix"
		case "Dip On Chair":
			return "dipOnChair"
		case "SQUATS":
			return "squats"
		case "PUSH UP":
			return "pushUp"
		default:
			return "chinups"
		}
	}

	func btnAddClicked(_ sender:UIButton!) {
		isAdding = !isAdding
		tableView.reloadData()
	}

	func btnBackClicked(_ sender:UIButton!) {
		backButton.Touched()
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

    func btnSettingsClicked(_ sender:UIButton) {
        self.performSegue(withIdentifier: "showSettings", sender: self)
    }

	func btnTableViewCellClicked(_ rowIndex: Int) {
        self.performSegue(withIdentifier: "showDetails", sender: self)

	}

	func AddImage(_ imageView: UIImageView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, named: String) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let image = UIImage(named: named)
		imageView.image = image
		imageView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		view.addSubview(imageView)
	}

	func AddLabel(_ label: UILabel, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, text: String, font: String, size: CGFloat, color: UInt32) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		label.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		label.text = text
		label.font = UIFont(name: font, size: size)
		label.textColor = constant.UIColorFromHex(color)
		view.addSubview(label)

	}

	func AddButton(_ button: UIButton, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, icon: String = "", background: String = "", title: String = "", titleColor: UIColor = UIColor.white, selector: Selector? = nil) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		button.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		button.setImage(UIImage(named: icon), for: UIControlState())
		button.setBackgroundImage(UIImage(named: background), for: UIControlState())
		button.setTitle(title, for: UIControlState())

		button.setTitleColor(UIColor.black, for: UIControlState())

		if selector != nil {
			button.addTarget(self, action: selector!, for: UIControlEvents.touchUpInside)
		}
		view.addSubview(button)
	}

	func AddTextBox(_ textView: UITextView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, font: String, size: CGFloat, color: UInt32) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		textView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		textView.font = UIFont(name: font, size: size)
		textView.textColor = constant.UIColorFromHex(color)
		textView.backgroundColor = constant.UIColorFromHex(0x373639)
		textView.textAlignment = NSTextAlignment.center
		view.addSubview(textView)
	}

	func AddBackground(_ label: UILabel, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, color: UInt32, alpha:Double = 1.0) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		label.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		label.backgroundColor = constant.UIColorFromHex(color, alpha: alpha)
		view.addSubview(label)
	}

	func AddTableView(_ object: ScreenObject.Object) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: object.xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: object.yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: object.width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.height)

		tableView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(ExercisesListCell.self, forCellReuseIdentifier: "cell")
		tableView.layoutMargins = UIEdgeInsets.zero
		tableView.separatorInset = UIEdgeInsets.zero
		tableView.separatorColor = constant.UIColorFromHex(constant.citrus)
		tableView.backgroundColor = constant.UIColorFromHex(object.color)

		tableView.rowHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.rowHeight)
		self.view.addSubview(tableView)
	}

	//tableview delegate
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		btnTableViewCellClicked(indexPath.row)
	}

	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		print(#function + " - indexPath: \(indexPath.row)")
	}

	func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
		print(#function + " - indexPath: \(indexPath.row)")
	}

	func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		return true
	}

	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if isAdding {
            return false
        } else {
            return true
        }
	}

	func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
		print(#function + " - indexPath: \(indexPath.row)")
		tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if isAdding {
			return fullExercisesName.count
		} else {
			exercisesName = defaults.GetArrayString(currentWorkoutName)
			return exercisesName.count
		}
	}

	func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
		print(#function + " - indexPath: \(indexPath.row)")
		return true
	}

	func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if isAdding {
            return false
        } else {
            return true
        }
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:ExercisesListCell! = tableView.dequeueReusableCell(withIdentifier: "cell") as! ExercisesListCell
		if isAdding {
			cell.isAdding = true
			cell.titleText = fullExercisesName[indexPath.row]
			if exercisesName.contains(cell.titleText) {
				cell.checkBox.isChecked(true)
			}
		} else {
			cell.isAdding = false
			cell.titleText = exercisesName[indexPath.row]
		}
        cell.mineHeight = tableView.rowHeight
		cell.currentWorkoutName = currentWorkoutName
		cell.iconNamed = FindExerciseIcon(cell.titleText)
		cell.updateCell()
		return cell
	}

	func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		print(#function + " - sourceIndexPath: \(sourceIndexPath)")
	}

	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		print(#function + " - indexPath: \(indexPath.row)")
	}

	func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
		print(#function + " - indexPath: \(indexPath.row)")
	}

	func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .default, title: "Delete") { action, index in
            print("share button tapped")
        }

        edit.backgroundColor = constant.UIColorFromHex(Constant.init().white)

        return [edit]
	}
}

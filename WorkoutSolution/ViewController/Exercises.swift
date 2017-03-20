//
//  Exercises.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 10/19/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Exercises: UIViewController, UITableViewDelegate, UITableViewDataSource {
	let addButton = UIButton()
	let backButton = BackButton()

	let constant = Constant()
	var tableView = UITableView()
	let screenObject = ScreenObject()

	let workouts = Application.instance.GetWorkouts()

	var currentName = ""
	var exercisesIndex = [Int]()

	var isAdding = false
	let defaults = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

		ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
		ScreenSize.setCurrentWidth(self.view.frame.size.width)
		ScreenSize.setCurrentHeight(self.view.frame.size.height)

		let homeIndex = [0, 3]
		let fullBodyIndex = [2, 5]
		let completeArmIndex = [1, 4]

		let workoutListName = defaults.GetArrayString("workoutListName")
		let workoutListIndex = Application.instance.CurrentWorkoutsListIndex()
		currentName = workoutListName[workoutListIndex]

		if (defaults.GetArrayInt(currentName) == [0]) {
			switch currentName {
			case "Home Workout":
				exercisesIndex = homeIndex
			case "Full Body Workout":
				exercisesIndex = fullBodyIndex
			case "Complete Arm Workout":
				exercisesIndex = completeArmIndex
			default:
				exercisesIndex = homeIndex
			}
			defaults.SetArrayInt(currentName, value: exercisesIndex)
		} else {
			exercisesIndex = defaults.GetArrayInt(currentName)
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
		screenObject.AddBackButton(backButton, view: self, xPosition: 70, yPosition: 93, width: 400, height: 120, title: "Routine", icon: "back", selector: #selector(btnBackClicked(_:)))
		backButton.title.sizeToFit()

		screenObject.AddButton(addButton, view: self.view, viewController: self, xPosition: 980, yPosition: 93, width: 220, height: 120, title: "Add", titleColor: constant.UIColorFromHex(constant.coralRed), selector: #selector(btnAddClicked(_:)))
	}

	func btnAddClicked(_ sender:UIButton!) {
		isAdding = !isAdding
		backButton.isHidden = isAdding
		if isAdding {
			addButton.setTitle("Done", for: UIControlState())
		} else {
			addButton.setTitle("Add", for: UIControlState())
		}
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
		tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if isAdding {
			return workouts.count
		} else {
			exercisesIndex = defaults.GetArrayInt(currentName)
			return exercisesIndex.count
		}
	}

	func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
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
			cell.titleText = workouts[indexPath.row].name
			cell.iconNamed = workouts[indexPath.row].icon
			cell.workoutIndex = indexPath.row
			if exercisesIndex.contains(cell.workoutIndex) {
				cell.checkBox.isChecked(true)
			}
		} else {
			cell.isAdding = false
			cell.titleText = workouts[exercisesIndex[indexPath.row]].name
			cell.iconNamed = workouts[exercisesIndex[indexPath.row]].icon
			cell.workoutIndex = exercisesIndex[indexPath.row]
		}
		cell.mineHeight = tableView.rowHeight
		cell.currentWorkoutName = currentName
		cell.initView()
		cell.updateCell()
		return cell
	}

	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		exercisesIndex.remove(at: indexPath.row)
		tableView.reloadData()
	}

	func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .default, title: "Delete") { action, index in
			self.exercisesIndex.remove(at: indexPath.row)
			self.defaults.SetArrayInt(self.currentName, value: self.exercisesIndex)
			tableView.reloadData()
        }
        edit.backgroundColor = constant.UIColorFromHex(Constant.init().citrus)

        return [edit]
	}
}

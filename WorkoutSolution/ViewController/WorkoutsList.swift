//
//  WorkoutList.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/18/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class WorkoutsList: UIViewController, UITableViewDelegate, UITableViewDataSource {
	var tableView = UITableView()

    let popupTitle = UILabel()
	let popupTextBox = UITextView()
    let popupAddButton = UIButton()
	var popupBackground = UIImageView()
	let screenBackground = UILabel()
    let popupCancelButton = UIButton()
    let popupBackgroundText = UIImageView()

	let constant = Constant()
	let screenObject = ScreenObject()

	var needDelete = [Int]()
	var workoutName = [String]()
	let workoutListName = "workoutListName"

	enum EditState {
		case none
		case editing
		case completed
	}
	var currentEditState = EditState.none

    override func viewDidLoad() {
        super.viewDidLoad()

        ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
        ScreenSize.setCurrentWidth(self.view.frame.size.width)
        ScreenSize.setCurrentHeight(self.view.frame.size.height)

		let defaults = UserDefaults()
		if (defaults.GetArrayString(workoutListName) == [""]) {
			workoutName = ["Home Workout", "Complete Arm Workout", "Full Body Workout"]
			defaults.SetArrayString(workoutListName, value: workoutName)
		} else {
			workoutName = defaults.GetArrayString(workoutListName)
		}
        initView()
        Application.instance.CurrentTab(Application.Tabs.workouts)
		Application.instance.CurrentWorkoutsView(Application.WorkoutsView.workouts)
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
        screenObject.ParseXML("WorkoutsList")
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

	func AddRow(_ value: String) {
		workoutName.append(value)
		let defaults = UserDefaults()
		defaults.SetArrayString(workoutListName, value: workoutName)
		tableView.reloadData()
	}

	func RemoveRows() {
		var current = 0
		var newWorkouts = [String]()
		while current < workoutName.count {
			if needDelete.first != current {
				newWorkouts.append(workoutName[current])
			} else {
				needDelete.removeFirst()
			}
			current = current + 1
		}
		workoutName = newWorkouts
		let defaults = UserDefaults()
		defaults.SetArrayString(workoutListName, value: workoutName)
		tableView.reloadData()
	}

	func AddTableView(_ object: ScreenObject.Object) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: object.xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: object.yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: object.width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.height)

		tableView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(WorkoutsListCell.self, forCellReuseIdentifier: "cell")
		tableView.layoutMargins = UIEdgeInsets.zero
		tableView.separatorInset = UIEdgeInsets.zero
		tableView.separatorColor = constant.UIColorFromHex(constant.citrus)
		tableView.backgroundColor = constant.UIColorFromHex(object.color)

		tableView.rowHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.rowHeight)
		self.view.addSubview(tableView)
	}

	func HidePopup() {
		popupTitle.frame = CGRect(x: ScreenSize.defaultWidth, y: ScreenSize.defaultHeight, width: 0, height: 0)
		popupTextBox.frame = CGRect(x: ScreenSize.defaultWidth, y: ScreenSize.defaultHeight, width: 0, height: 0)
		popupAddButton.frame = CGRect(x: ScreenSize.defaultWidth, y: ScreenSize.defaultHeight, width: 0, height: 0)
		popupCancelButton.frame = CGRect(x: ScreenSize.defaultWidth, y: ScreenSize.defaultHeight, width: 0, height: 0)
		popupBackground.frame = CGRect(x: ScreenSize.defaultWidth, y: ScreenSize.defaultHeight, width: 0, height: 0)
		screenBackground.frame = CGRect(x: ScreenSize.defaultWidth, y: ScreenSize.defaultHeight, width: 0, height: 0)
        popupBackgroundText.frame.origin.x = ScreenSize.defaultWidth
        dismissKeyboard()
	}

	func btnAddClicked(_ sender:UIButton!) {
		let font = "Arial-BoldMT"
        screenObject.AddBackground(screenBackground, view: view, xPosition: 0, yPosition: 0, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: 0x373639, alpha: 0.7)
        screenObject.AddImage(popupBackground, view: view, xPosition: 92, yPosition: 223 + 409, width: ScreenSize.defaultWidth - 184, height: 660, named: "addBackground")
		screenObject.AddLabel(popupTitle, view: view, xPosition: 373, yPosition: 223 + 409 + 95, width: ScreenSize.defaultWidth - 746, height: 75, text: "New Workout", font: font, size: 20, color: 0xffffff)
        screenObject.AddTextBox(popupTextBox, view: view,background: popupBackgroundText, xPosition: 250, yPosition: 857, width: ScreenSize.defaultWidth - 500, height: 160, font: font, size: 18, color: 0xffffff)
        screenObject.AddButton(popupAddButton, view: view, viewController: self, xPosition: 725, yPosition: 1072, width: 295, height: 125, title: "ADD", selector: #selector(btnAddPopupClicked(_:)))
        screenObject.AddButton(popupCancelButton, view: view, viewController: self, xPosition: 222, yPosition: 1072, width: 295, height: 125, title: "CANCEL", selector: #selector(btnCancelPopupClicked(_:)))
	}

	func btnEditClicked(_ sender:UIButton!) {
		switch currentEditState {
		case EditState.none: currentEditState = EditState.editing
		case EditState.editing: currentEditState = EditState.completed
		case EditState.completed: break
		}
		tableView.reloadData()
	}

	func btnAddPopupClicked(_ sender:UIButton!) {
		if (popupTextBox.text != nil) {
			AddRow(popupTextBox.text)
		}
		HidePopup()
	}

	func btnCancelPopupClicked(_ sender:UIButton!) {
		HidePopup()
	}

    func btnDetailsClicked(_ sender:UIButton!) {
        self.performSegue(withIdentifier: "showDetails", sender: self)
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
		if currentEditState != EditState.editing {
            Application.instance.CurrentWorkoutsListIndex(rowIndex)
			self.performSegue(withIdentifier: "showExercises", sender: self)
		}
	}

    func dismissKeyboard() {
        view.endEditing(true)
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
		return true
	}

	func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
		print(#function + " - indexPath: \(indexPath.row)")
		tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return workoutName.count
	}

	func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
		print(#function + " - indexPath: \(indexPath.row)")
		return true
	}

	func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
		return true
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:WorkoutsListCell! = tableView.dequeueReusableCell(withIdentifier: "cell") as! WorkoutsListCell
		cell.titleText = workoutName[indexPath.row]
		switch currentEditState {
		case EditState.none: cell.isEditing = false
		case EditState.editing: cell.isEditing = true
		case EditState.completed:
			cell.isEditing = false
			if cell.checkBox.isChecked() {
				needDelete.append(indexPath.row)
			}
			if indexPath.row == workoutName.count - 1  {
				currentEditState = EditState.none
				RemoveRows()
			}
		}
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
		let edit = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
			print("share button tapped")
		}
		edit.backgroundColor = constant.UIColorFromHex(constant.citrus)

		return [edit]
	}
}

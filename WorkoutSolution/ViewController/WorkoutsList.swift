//
//  WorkoutList.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/18/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class WorkoutsList: UIViewController, UITableViewDelegate, UITableViewDataSource {
	let tableView = UITableView()
	let workoutListName = "workoutListName"
    let screenObject = ScreenObject()

	var workoutName = [""]//["Home Workout", "Complete Arm Workout", "Full Body Workout"]


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

	func AddTableView(_ object: ScreenObject.Object) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: object.xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: object.yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: object.width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.height)

		tableView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.layoutMargins = UIEdgeInsets.zero
		tableView.separatorInset = UIEdgeInsets.zero
		let constant = Constant()
		tableView.backgroundColor = constant.UIColorFromHex(object.color)//constant.UIColorFromHex(constant.coralRed)

		tableView.rowHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.rowHeight)
		self.view.addSubview(tableView)
	}

	func btnAddClicked(_ sender:UIButton!) {
		screenObject.AddBackground(self.view, xPosition: 0, yPosition: 0, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: 0x373639, alpha: 0.7)
		screenObject.AddBackground(self.view, xPosition: 132, yPosition: 772, width: 978, height: 665, color: 0xF94343)
		screenObject.AddButton(self, xPosition: 222, yPosition: 1222, width: 295, height: 125, background: "buttonAdd", title: "CANCEL", selector: NSSelectorFromString("btnCancelPopupClicked:"))
		screenObject.AddButton(self, xPosition: 725, yPosition: 1222, width: 295, height: 125, background: "buttonAdd", title: "ADD", selector: NSSelectorFromString("btnAddPopupClicked:"))
	}

	func btnAddPopupClicked(_ sender:UIButton!) {
		return
	}

	func btnCancelPopupClicked(_ sender:UIButton!) {
		return
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

    func btnSettingClicked(_ sender:UIButton) {
    }

	func btnTableViewCellClicked(_ rowIndex: Int) {
		self.performSegue(withIdentifier: "showExercises", sender: self)
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
		return false
	}

	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return false
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
		let constant = Constant()
		let screenObject = ScreenObject()

		let cellFont = "Arial"
		let cellText = workoutName[indexPath.row]

		let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
		cell.backgroundColor = constant.UIColorFromHex(constant.coralRed)
		screenObject.AddLabel(cell.contentView, xPosition: 100, yPosition: 72, width: 700, height: 51, text: cellText, font: cellFont, size: 14, color: constant.citrus)
		screenObject.AddImage(cell.contentView, xPosition: ScreenSize.defaultWidth - 135, yPosition: 72, width: 35, height: 51, named: "list")

		return cell
	}

	func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
		print(#function + " - section: \(section)")
	}

	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		print(#function + " - section: \(section)")
	}

	func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
		print(#function + " - section: \(section)")
	}

	func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
		print(#function + " - section: \(section)")
	}

	func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		print(#function + " - indexPath: \(indexPath.row)")
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

	/*
	func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
			print("share button tapped")
		}
		edit.backgroundColor = UIColor.blue

		return [edit]
	}
	*/
}

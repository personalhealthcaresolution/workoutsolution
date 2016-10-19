//
//  Workouts.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 10/18/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Workouts: UIViewController, UITableViewDelegate, UITableViewDataSource {
	let tableView = UITableView()
	let screenObject = ScreenObject()

	let upperText = ["CHINUPS", "WALL SIX"]
	let upperIcon = ["chinups", "wallSix"]

	let lowerText = ["Dip On Chair", "SQUATS"]
	let lowerIcon = ["dipOnChair", "squats"]

	let coreAbsText = ["PUSH UP"]
	let coreAbsIcon = ["pushUp"]

	let beginnerText = ["CHINUPS"]
	let beginnerIcon = ["chinups"]

	let intermediateText = ["WALL SIX"]
	let intermediateIcon = ["wallSix"]

	let advancedText = ["Dip On Chair"]
	let advancedIcon = ["dipOnChair"]

	let expertText = ["SQUATS", "PUSH UP"]
	let expertIcon = ["squats", "pushUp"]

	var workoutName = ["CHINUPS", "WALL SIX", "Dip On Chair"]
	var workoutIcon = ["chinups", "wallSix", "dipOnChair"]

    override func viewDidLoad() {
        super.viewDidLoad()

		ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
		ScreenSize.setCurrentWidth(self.view.frame.size.width)
		ScreenSize.setCurrentHeight(self.view.frame.size.height)

		switch Application.instance.CurrentWorkout() {
		case Application.Workouts.type:
			switch Application.instance.CurrentWorkoutType() {
			case Application.WorkoutsType.lower:
				workoutName = lowerText;
				workoutIcon = lowerIcon;
			case Application.WorkoutsType.upper:
				workoutName = upperText;
				workoutIcon = upperIcon;
			case Application.WorkoutsType.coreAbs:
				workoutName = coreAbsText;
				workoutIcon = coreAbsIcon;
			}
		case Application.Workouts.level:
			switch Application.instance.CurrentWorkoutLevel() {
			case Application.WorkoutsLevel.advanced:
				workoutName = advancedText;
				workoutIcon = advancedIcon;
			case Application.WorkoutsLevel.beginner:
				workoutName = beginnerText;
				workoutIcon = beginnerIcon;
			case Application.WorkoutsLevel.expert:
				workoutName = expertText;
				workoutIcon = expertIcon;
			case Application.WorkoutsLevel.intermediate:
				workoutName = intermediateText;
				workoutIcon = intermediateIcon;
			}
		}

		initView()
		Application.instance.CurrentExercisesView(Application.ExercisesView.workouts)
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

		AddTableView(xPosition: 0, yPosition: 223, width: ScreenSize.defaultWidth, height: 1797)
	}

	func AddTableView(xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		tableView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.layoutMargins = UIEdgeInsets.zero
		tableView.separatorInset = UIEdgeInsets.zero
		//tableView.tableFooterView = UIView()
		tableView.rowHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: 339)
		self.view.addSubview(tableView)
	}

	func btnBackClicked(_ sender:UIButton!) {
		switch Application.instance.CurrentWorkout() {
		case Application.Workouts.type:
			self.performSegue(withIdentifier: "showType", sender: self)
		case Application.Workouts.level:
			self.performSegue(withIdentifier: "showLevel", sender: self)
		}
	}

	func btnDetailsClicked(_ sender:UIButton!) {
		self.performSegue(withIdentifier: "showDetails", sender: self)
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

	func btnTableViewCellClicked(_ rowIndex: Int) {
		self.performSegue(withIdentifier: "showDetails", sender: self)
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
		let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")

		let constant = Constant()
		cell.backgroundColor = constant.UIColorFromHex(constant.coralRed)
		let screenObject = ScreenObject()
		screenObject.AddImage(cell.contentView, xPosition: 100, yPosition: 18, width: 303, height: 303, named: workoutIcon[indexPath.row])
		screenObject.AddLabel(cell.contentView, xPosition: 503, yPosition: 140, width: 500, height: 59, text: workoutName[indexPath.row], font: "HelveticaNeue-Bold", size: 16, color: constant.citrus)

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

	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		print(#function + " - indexPath: \(indexPath.row)")
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
}
//
//  WorkoutList.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/18/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class WorkoutsList: UIViewController, UITableViewDelegate, UITableViewDataSource {
	let tabString: String = ""
    let screenObject = ScreenObject()

	var workoutName = ["CHINUPS", "WALL SIX", "Dip On Chair"]
	var workoutIcon = ["chinups", "wallSix", "dipOnChair"]

    override func viewDidLoad() {
        super.viewDidLoad()

        ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
        ScreenSize.setCurrentWidth(self.view.frame.size.width)
        ScreenSize.setCurrentHeight(self.view.frame.size.height)

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
        //screenObject.ParseXML("WorkoutsList")
        screenObject.ParseXML("Footer")
        //screenObject.DrawScreen(self, currentTab: tabString)

		screenObject.AddTableView(self, xPosition: 0, yPosition: 223, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight)

		var objects = screenObject.GetObjects()
		while objects.count > 0 {
			var object = ScreenObject.Object()
			object = objects.first!
			screenObject.DrawObject(self, object: object)
			objects.removeFirst()
		}
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
		switch Application.instance.currentExercisesView {
		case Application.ExercisesView.type:
			self.performSegue(withIdentifier: "showType", sender: self)
		case Application.ExercisesView.level:
			self.performSegue(withIdentifier: "showLevel", sender: self)
		case Application.ExercisesView.details:
			self.performSegue(withIdentifier: "showDetails", sender: self)
		}
    }

    func btnWorkoutsClicked(_ sender:UIButton) {
    }

    func btnTrackerClicked(_ sender:UIButton) {
    }

    func btnSettingClicked(_ sender:UIButton) {
    }

	func btnSquatsClicked(_ sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnSquatsClicked")
	}

	func btnPullUpClicked(_ sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnPullUpClicked")
	}

	func btnClappingPullUpClicked(_ sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnClappingPullUpClicked")
	}

	func btnChestHighPullUpClicked(_ sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnChestHighPullUpClicked")
	}

	func btnTypeWriterPullUpClicked(_ sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnTypeWriterPullUpClicked")
	}

	func btnChinupClicked(_ sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnChinupClicked")
	}

	func btnWallSixClicked(_ sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnWallSixClicked")
	}

	func btnDipOnChairClicked(_ sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnDipOnChairClicked")
	}

	//tableview delegate
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(#function + " - indexPath: \(indexPath)")
	}

	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		print(#function + " - indexPath: \(indexPath)")
	}

	func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
		print(#function + " - indexPath: \(indexPath)")
	}

	func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		print(#function + " - indexPath: \(indexPath)")
		return true
	}

	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		print(#function + " - indexPath: \(indexPath)")
		return true
	}

	func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
		print(#function + " - indexPath: \(indexPath)")
	}

	func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
		print(#function + " - indexPath: \(indexPath)")
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		print(#function + " - count: \(workoutName.count)")
		return workoutName.count
	}

	func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
		print(#function + " - count: \(workoutName.count)")
	}

	func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
		print(#function + " - indexPath: \(indexPath)")
		return true
	}

	func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
		print(#function + " - indexPath: \(indexPath)")
		return false
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		print(#function + " - indexPath: \(indexPath)")
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
		print(#function + " - indexPath: \(indexPath)")
	}

	func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		print(#function + " - indexPath: \(indexPath)")
	}

	func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		print(#function + " - sourceIndexPath: \(sourceIndexPath)")
	}

	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		print(#function + " - indexPath: \(indexPath)")
	}

	func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
		print(#function + " - indexPath: \(indexPath)")
	}

	func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
			print("share button tapped")
		}
		edit.backgroundColor = UIColor.blue

		return [edit]
	}
}

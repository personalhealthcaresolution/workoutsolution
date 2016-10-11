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

	var carName = ["Lamborghini", "Drift", "Ferrari", "Hyundai", "Mercedes Benz", "Mitsubishi", "Nissan", "Volkswagen"]

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

		var objects = screenObject.GetObjects()
		while objects.count > 0 {
			var object = ScreenObject.Object()
			object = objects.first!
			screenObject.DrawObject(self, object: object)
			objects.removeFirst()
		}

		screenObject.AddTableView(self, xPosition: 0, yPosition: 223, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight)
	}

	func GetTabString(_ currentTab: Application.FooterTab) -> String {
		switch currentTab {
		case Application.FooterTab.exercises:
			return "Exercises"
		case Application.FooterTab.workouts:
			return "Workouts"
		case Application.FooterTab.tracker:
			return "Tracker"
		case Application.FooterTab.settings:
			return "Settings"
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
        if Application.instance.CurrentTab() != Application.FooterTab.exercises {
            Application.instance.CurrentTab(Application.FooterTab.exercises)
            initView()
        }
    }

    func btnWorkoutsClicked(_ sender:UIButton) {
		if Application.instance.CurrentTab() != Application.FooterTab.workouts {
			Application.instance.CurrentTab(Application.FooterTab.workouts)
			initView()
		}
    }

    func btnTrackerClicked(_ sender:UIButton) {
		if Application.instance.CurrentTab() != Application.FooterTab.tracker {
			Application.instance.CurrentTab(Application.FooterTab.tracker)
			initView()
		}
    }

    func btnSettingClicked(_ sender:UIButton) {
		if Application.instance.CurrentTab() != Application.FooterTab.settings {
			Application.instance.CurrentTab(Application.FooterTab.settings)
			initView()
		}
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

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return carName.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:TableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
		//cell.label.text = carName[indexPath.row]
		cell.textLabel?.text = carName[indexPath.row]

		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: 100)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: 18)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: 303)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: 303)
		let image = UIImage(named: "dipOnChair")
		let imageView = UIImageView(image: image!)
		imageView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		cell.contentView.addSubview(imageView)

		return cell
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	}
}

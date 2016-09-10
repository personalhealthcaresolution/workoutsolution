//
//  WorkoutList.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/18/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Workouts: UIViewController {
    var currenTab: String = "exercises"
    let screenObject = ScreenObject()

    override func viewDidLoad() {
        super.viewDidLoad()

        ScreenSize.setStatusHeight(UIApplication.sharedApplication().statusBarFrame.size.height)
        ScreenSize.setCurrentWidth(self.view.frame.size.width)
        ScreenSize.setCurrentHeight(self.view.frame.size.height)

        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        let swap = ScreenSize.getCurrentWidth()
        ScreenSize.setCurrentWidth(ScreenSize.getCurrentHeight())
        ScreenSize.setCurrentHeight(swap)
        //initView()
    }

    func initView() {
        var objects = [ScreenObject.Object()]
        var objectsDraw = [ScreenObject.Object()]

        screenObject.ParseXML(currenTab)
        screenObject.ParseXML("footer")
        objects = screenObject.GetObjects()

        while objects.count > 0 {
            var object = ScreenObject.Object()
            object = objects.first!
            if object.selectorRaw != "" {
                object.selector = getSelector(object.selectorRaw)
            }
            objectsDraw.append(object)
            objects.removeFirst()
        }
        screenObject.objects = objectsDraw
        screenObject.DrawScreen(self, currentTab: currenTab)
    }

    func getSelector(value: String) -> Selector {
        switch value {
        case "btnBackClicked":
            return #selector(Workouts.btnBackClicked(_:))
        case "btnDetailsClicked":
            return #selector(Workouts.btnDetailsClicked(_:))
        case "btnExercisesClicked":
            return #selector(Workouts.btnExercisesClicked(_:))
        case "btnWorkoutsClicked":
            return #selector(Workouts.btnWorkoutsClicked(_:))
        case "btnTrackerClicked":
            return #selector(Workouts.btnTrackerClicked(_:))
        case "btnSettingClicked":
            return #selector(Workouts.btnSettingClicked(_:))
		case "btnSquatsClicked":
			return #selector(Workouts.btnSquatsClicked(_:))
		case "btnPullUpClicked":
			return #selector(Workouts.btnPullUpClicked(_:))
		case "btnClappingPullUpClicked":
			return #selector(Workouts.btnClappingPullUpClicked(_:))
		case "btnChestHighPullUpClicked":
			return #selector(Workouts.btnChestHighPullUpClicked(_:))
		case "btnTypeWriterPullUpClicked":
			return #selector(Workouts.btnTypeWriterPullUpClicked(_:))
		case "btnChinupClicked":
			return #selector(Workouts.btnBackClicked(_:))
		case "btnWallSixClicked":
			return #selector(Workouts.btnWallSixClicked(_:))
		case "btnDipOnChairClicked":
			return #selector(Workouts.btnDipOnChairClicked(_:))
        default:
            return nil
        }
    }

    func btnDetailsClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showDetails", sender: self)
    }

    func btnBackClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showType", sender: self)
    }

    func btnExercisesClicked(sender:UIButton) {
        if currenTab != "exercises" {
            currenTab = "exercises"
            initView()
        }
    }

    func btnWorkoutsClicked(sender:UIButton) {
        if currenTab != "workouts" {
            currenTab = "workouts"
            initView()
        }
    }

    func btnTrackerClicked(sender:UIButton) {
        if currenTab != "tracker" {
            currenTab = "tracker"
            initView()
        }
    }

    func btnSettingClicked(sender:UIButton) {
        if currenTab != "settings" {
            //currenTab = "settings"
            //initView()
        }
    }

	func btnSquatsClicked(sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnSquatsClicked")
	}

	func btnPullUpClicked(sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnPullUpClicked")
	}

	func btnClappingPullUpClicked(sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnClappingPullUpClicked")
	}

	func btnChestHighPullUpClicked(sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnChestHighPullUpClicked")
	}

	func btnTypeWriterPullUpClicked(sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnTypeWriterPullUpClicked")
	}

	func btnChinupClicked(sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnChinupClicked")
	}

	func btnWallSixClicked(sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnWallSixClicked")
	}

	func btnDipOnChairClicked(sender:CheckBox!) {
		sender.buttonClicked(sender, key: "btnDipOnChairClicked")
	}
}
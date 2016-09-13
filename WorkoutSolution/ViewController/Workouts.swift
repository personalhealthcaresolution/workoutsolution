//
//  WorkoutList.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/18/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Workouts: UIViewController {
	let tabString: String = ""
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
		let tabString = Application.instance.TabString()

        screenObject.ParseXML(tabString)
        screenObject.ParseXML("Footer")
        screenObject.DrawScreen(self, currentTab: tabString)
    }

    func btnDetailsClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showDetails", sender: self)
    }

    func btnBackClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showType", sender: self)
    }

    func btnExercisesClicked(sender:UIButton) {
        if Application.instance.CurrentTab() != Application.FooterTab.EXERCISES {
            Application.instance.CurrentTab(Application.FooterTab.EXERCISES)
            initView()
        }
    }

    func btnWorkoutsClicked(sender:UIButton) {
		if Application.instance.CurrentTab() != Application.FooterTab.WORKOUTS {
			Application.instance.CurrentTab(Application.FooterTab.WORKOUTS)
			initView()
		}
    }

    func btnTrackerClicked(sender:UIButton) {
		if Application.instance.CurrentTab() != Application.FooterTab.TRACKER {
			Application.instance.CurrentTab(Application.FooterTab.TRACKER)
			initView()
		}
    }

    func btnSettingClicked(sender:UIButton) {
		if Application.instance.CurrentTab() != Application.FooterTab.SETTINGS {
			Application.instance.CurrentTab(Application.FooterTab.SETTINGS)
			initView()
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
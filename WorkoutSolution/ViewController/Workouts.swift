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
		let tabString = Application.instance.TabString()

        screenObject.ParseXML(tabString)
        screenObject.ParseXML("Footer")
        screenObject.DrawScreen(self, currentTab: tabString)
    }

    func btnDetailsClicked(_ sender:UIButton!) {
        self.performSegue(withIdentifier: "showDetails", sender: self)
    }

    func btnBackClicked(_ sender:UIButton!) {
        self.performSegue(withIdentifier: "showType", sender: self)
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
}

//
//  FooterButton.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 10/31/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class FooterButton: UIButton {
	let icon = UIImageView()
	var title = UILabel()
	let constant = Constant()

	var textX: CGFloat = 0
	var imageText = ""
    var titleText = ""

	init() {
		super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

		let screenObject = ScreenObject()
		screenObject.ParseXML("FooterButton")
		var objects = screenObject.GetObjects()
		while objects.count > 0 {
			var object = ScreenObject.Object()
			object = objects.first!

			switch object.type {
			case "image":
				screenObject.AddImage(icon, view: self, object: object)
			case "label":
				screenObject.AddLabel(title, view: self, object: object)
			default: break
			}
			objects.removeFirst()
		}



	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func UpdateButton() {
		GetImageText()
		let image = UIImage(named: imageText)
		icon.image = image
        title.textAlignment = NSTextAlignment.center
	}

	func GetImageText() {
		switch Application.instance.CurrentTab() {
		case Application.Tabs.exercises:
			if imageText == "exercises" {
				imageText = "exercisesTouch"
				title.textColor = constant.UIColorFromHex(constant.coralRed)
			}
		case Application.Tabs.workouts:
			if imageText == "workouts" {
				imageText = "workoutsTouch"
				title.textColor = constant.UIColorFromHex(constant.coralRed)
			}
		case Application.Tabs.settings:
			if imageText == "settings" {
				imageText = "settingsTouch"
				title.textColor = constant.UIColorFromHex(constant.coralRed)
			}
		}
	}
}

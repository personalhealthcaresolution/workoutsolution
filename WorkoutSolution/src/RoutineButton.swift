//
//  RoutineButton.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 11/17/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class RoutineButton: UIButton {
	let icon = UIImageView()
	let title = UILabel()

	var text = ""
	var fontName = "Arial-BoldMT"
	var iconNamed = ""

	init() {
		super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func initView() {
		let screenObject = ScreenObject()
		screenObject.ParseXML("RoutineButton")
		for object in screenObject.GetObjects() {
			switch object.type {
			case "label":
				screenObject.AddLabel(title, view: self, object: object)
			case "image":
				screenObject.AddImage(icon, view: self, object: object)
			default: break
			}
		}

		title.sizeToFit()
		title.frame.origin.x = (frame.width - title.frame.width) / 2
		title.frame.origin.y = ((frame.height - title.frame.height) / 2) + 1
        title.textAlignment = NSTextAlignment.center
	}

	func Touched() {
		let constant = Constant()
		let image = UIImage(named: "buttonTouch")
		icon.image = image
		title.textColor = constant.UIColorFromHex(constant.coralRed)
	}
}

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
		let constant = Constant()
		let screenObject = ScreenObject()
		screenObject.AddImage(icon, view: self, xPosition: 0, yPosition: 0, width: 724, height: 149, named: "button")
		screenObject.AddLabel(title, view: self, xPosition: 0, yPosition: 0, width: 724, height: 149, text: "START ROUTINE", font: fontName, size: 18, color: constant.citrus)
        title.textAlignment = NSTextAlignment.center
	}

	func Touched() {
		let constant = Constant()
		let image = UIImage(named: "buttonTouch")
		icon.image = image
		title.textColor = constant.UIColorFromHex(constant.coralRed)
	}
}

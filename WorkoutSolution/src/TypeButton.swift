//
//  Button.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 10/27/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class TypeButton: UIButton {
	let icon = UIImageView()
	let title = UILabel()
	let background = UILabel()

	var imageText = ""

	init() {
		super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

		let screenObject = ScreenObject()
		screenObject.ParseXML("TypeButton")
		for object in screenObject.GetObjects() {
			switch object.type {
			case "label":
				screenObject.AddLabel(title, view: self, object: object)
			case "image":
				screenObject.AddImage(icon, view: self, object: object)
			case "background":
				screenObject.AddBackground(background, view: self, object: object)
			default: break
			}
		}
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func UpdateButton() {
		title.sizeToFit()
		title.frame.origin.y = (frame.height - title.frame.height) / 2

		let image = UIImage(named: imageText)
		icon.image = image
	}

	func Touched(_ sender:UIButton) {
		let touch = UILabel()
		var object = ScreenObject.Object()
		object.xPosition = 0
		object.yPosition = 0
		object.width = ScreenSize.defaultWidth
		object.height = 380
		object.color = Constant.init().citrus

		let screenObject = ScreenObject()
		screenObject.AddBackground(touch, view: self, object: object, alpha: 0.5)
	}
}

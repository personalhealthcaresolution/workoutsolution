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
	let touched = UILabel()
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
		let image = UIImage(named: imageText)
		icon.image = image
	}
}

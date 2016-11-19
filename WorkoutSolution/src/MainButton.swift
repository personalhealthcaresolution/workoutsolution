//
//  MainButton.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 11/16/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class MainButton: UIButton {
	let icon = UIImageView()
	let title = UILabel()
	//let touch = UILabel()

	var text = ""
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

		var object = ScreenObject.Object()
		object.xPosition = 0
		object.yPosition = 0
		object.width = 264
		object.height = 264
		object.named = iconNamed
		screenObject.AddImage(icon, view: self, object: object)

		object = ScreenObject.Object()
		object.xPosition = 322
		object.yPosition = 97
		object.width = 300
		object.height = 70
		object.size = 23
		object.font = "Arial"
		object.text = text
		object.color = constant.white
		screenObject.AddLabel(title, view: self, object: object)
	}

	func Touched() {
        let image = UIImage(named: iconNamed + "Touch")
        icon.image = image
	}
}

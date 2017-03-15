//
//  WorkoutCell.swift
//  WorkoutSolution
//
//  Created by ian on 3/9/17.
//  Copyright © 2017 Khai Dao. All rights reserved.
//

import UIKit

class WorkoutCell: TableViewCell {
	let icon = UIImageView()
	let label = UILabel()

	var iconText = ""
	var labelText = ""

	override func initView() {
		let constant = Constant()
		backgroundColor = constant.UIColorFromHex(constant.coralRed)

		let screenObject = ScreenObject()
		var object = ScreenObject.Object()

		object.xPosition = 50
		object.yPosition = 18
		object.width = 303
		object.height = 303
		object.named = iconText
		screenObject.AddImage(icon, view: contentView, object: object, useBundle: true)

		object.xPosition = 403
		object.yPosition = 120
		object.width = 600
		object.height = 97
		object.font = "Arial"
		object.size = 20
		object.text = labelText
		object.color = constant.citrus
		screenObject.AddLabel(label, view: contentView, object: object)
	}

	func SetIcon(_ value: String) {
		iconText = value
	}

	func SetText(_ value: String) {
		labelText = value
	}
}

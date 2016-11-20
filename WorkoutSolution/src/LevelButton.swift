//
//  LevelButton.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 10/28/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class LevelButton: UIButton {
	let icon = UIImageView()
	let title = UILabel()
	let constant = Constant()

	var textX: CGFloat = 0
	var imageText = ""

	init() {
		super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
		AddLabel(title, xPosition: 0, yPosition: 35, width: 620, height: 60, text: "", font: "Arial", size: 20, color: constant.citrus)
		AddImage(icon, xPosition: 97, yPosition: 130, width: 415, height: 415, named: "")
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func UpdateButton() {
		let image = UIImage(named: imageText)
		icon.image = image
	}

	func AddLabel(_ label: UILabel, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, text: String, font: String, size: CGFloat, color: UInt32) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		label.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		label.text = text
		label.font = UIFont(name: font, size: size)
		label.textColor = constant.UIColorFromHex(color)
		label.textAlignment = NSTextAlignment.center
		addSubview(label)

	}

	func AddImage(_ icon: UIImageView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, named: String) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let image = UIImage(named: named)
		icon.image = image
		icon.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		addSubview(icon)
	}

	func Touched(_ sender:UIButton) {
		let touch = UILabel()
		var object = ScreenObject.Object()
		object.xPosition = 0
		object.yPosition = 0
		object.width = 620
		object.height = 580
		object.color = Constant.init().citrus
		
		let screenObject = ScreenObject()
		screenObject.AddBackground(touch, view: self, object: object, alpha: 0.5)
	}
}

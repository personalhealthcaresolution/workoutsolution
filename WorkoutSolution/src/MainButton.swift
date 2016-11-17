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
	var fontName = "Arial"
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
		screenObject.AddImage(icon, view: self, xPosition: 0, yPosition: 0, width: 264, height: 264, named: iconNamed)
		screenObject.AddLabel(title, view: self, xPosition: 322, yPosition: 97, width: 300, height: 70, text: text, font: fontName, size: 23, color: constant.white)
	}

	func Touched() {
        let image = UIImage(named: iconNamed + "Touch")
        icon.image = image
	}
}

//
//  BackButton.swift
//  WorkoutSolution
//
//  Created by ian on 10/30/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class BackButton: UIButton {
    let icon = UIImageView()
    let title = UILabel()
	let touch = UILabel()

    let constant = Constant()
    
    var textX: CGFloat = 0
    var imageText = ""
	var titleText = "Back"
	
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

		let screenObject = ScreenObject()
		screenObject.ParseXML("BackButton")
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
		title.sizeToFit()

		var object = ScreenObject.Object()
		object.width = 400
		object.height = 120
		object.color = constant.citrus
		screenObject.AddBackground(touch, view: self, object: object, alpha: 0.5)
		touch.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func UpdateButton() {
        let image = UIImage(named: imageText)
        icon.image = image
		title.text = titleText
        title.frame.origin.x = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: textX)
    }

	func Touched() {
		touch.isHidden = false
	}
}

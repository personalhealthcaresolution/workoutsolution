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
    let constant = Constant()
    
    var textX: CGFloat = 0
    var imageText = ""
    
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
				screenObject.AddImage(icon, view: self, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, named: object.named)
			case "label":
				screenObject.AddLabel(title, view: self, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, text: object.text, font: object.font, size: object.size, color: object.color)
			default: break
			}
			objects.removeFirst()
		}



    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func UpdateButton() {
        let image = UIImage(named: imageText)
        icon.image = image
        title.frame.origin.x = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: textX)
    }
}

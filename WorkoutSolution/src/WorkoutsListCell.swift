//
//  TableViewCell.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 10/8/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class WorkoutsListCell: UITableViewCell {
	let icon = UIImageView()
	let title = UILabel()
	var titleText = ""

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		let constant = Constant()
		self.backgroundColor = constant.UIColorFromHex(0xFFFFFF)

        let screenObject = ScreenObject()

		var object = ScreenObject.Object()
		object.xPosition = 100
		object.yPosition = 60
		object.width = 700
		object.height = 75
		object.text = titleText
		object.font = "Arial"
		object.size = 18
		object.color = constant.citrus
		screenObject.AddLabel(title, view: contentView, object: object)

		if isEditing == false {
			object = ScreenObject.Object()
			object.xPosition = ScreenSize.defaultWidth - 135
			object.yPosition = 72
			object.width = 35
			object.height = 51
			object.named = "listWorkout"
			screenObject.AddImage(icon, view: contentView, object: object)
		}
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func awakeFromNib() {
		super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

	func updateCell() {
		var positionX: CGFloat = 0
		if isEditing {
			icon.isHidden = true
			positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: 50)
		} else {
			icon.isHidden = false
			positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: 100)
		}
        title.text = titleText
		title.frame = CGRect(x: positionX, y: title.frame.origin.y, width: title.frame.width, height: title.frame.height)
	}
}

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
	let checkBox = CheckBox()
	var titleText = ""
	let hamburger = UIImageView()

	let constant = Constant()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		self.backgroundColor = constant.UIColorFromHex(constant.coralRed)
        let screenObject = ScreenObject()
		screenObject.AddLabel(title, view: contentView, xPosition: 245, yPosition: 60, width: 700, height: 75, text: titleText, font: "Arial", size: 18, color: constant.citrus)
		screenObject.AddImage(icon, view: contentView, xPosition: ScreenSize.defaultWidth - 135, yPosition: 72, width: 35, height: 51, named: "listWorkout")
		screenObject.AddImage(hamburger, view: contentView, xPosition: ScreenSize.defaultWidth - 159, yPosition: 68, width: 59, height: 59, named: "hamburger")
        screenObject.AddCheckBox(checkBox, view: contentView, xPosition: 100, yPosition: 50, width: 95, height: 95, selector: NSSelectorFromString("btnCheckBoxClicked:"))//y = 75, width = 45, height = 45

		checkBox.SetCheckImange("workoutsChecked")
		checkBox.SetCheckedImange("workoutsChecked")
		checkBox.updateImage()
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
		title.text = titleText
		if isEditing {
			icon.isHidden = true
			checkBox.isHidden = false
			hamburger.isHidden = false
		} else {
			icon.isHidden = false
			checkBox.isHidden = true
			hamburger.isHidden = true
		}
	}

	func btnCheckBoxClicked(_ sender:UIButton!) {
	}
}

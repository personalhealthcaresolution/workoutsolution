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
		AddLabel(title, xPosition: 100, yPosition: 60, width: 700, height: 75, text: titleText, font: "Arial", size: 18, color: constant.citrus)
		AddImage(icon, xPosition: ScreenSize.defaultWidth - 135, yPosition: 72, width: 35, height: 51, named: "listWorkout")
		AddImage(hamburger, xPosition: ScreenSize.defaultWidth - 159, yPosition: 68, width: 59, height: 59, named: "hamburger")
		AddCheckBox(checkBox, xPosition: 100, yPosition: 50, width: 95, height: 95, selector: NSSelectorFromString("btnCheckBoxClicked:"))//y = 75, width = 45, height = 45

		checkBox.SetCheckImange("workoutsCheck")
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
		var positionX: CGFloat = 0
		if isEditing {
			icon.isHidden = true
			checkBox.isHidden = false
			hamburger.isHidden = false
			positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: 195)
		} else {
			icon.isHidden = false
			checkBox.isHidden = true
			hamburger.isHidden = true
			positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: 100)
		}

		title.frame = CGRect(x: positionX, y: title.frame.origin.y, width: title.frame.width, height: title.frame.height)
	}

	func AddImage(_ icon: UIImageView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, named: String) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let image = UIImage(named: named)
		icon.image = image
		icon.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		contentView.addSubview(icon)
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
		contentView.addSubview(label)
		
	}

	func AddCheckBox(_ check: CheckBox, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, checked: String = "", checkImage: String = "", checkedImage: String = "", selector: Selector? = nil) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		check.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		check.SetCheckImange(checkImage)
		check.SetCheckedImange(checkedImage)
		if (selector != nil) {
			check.addTarget(self, action: selector!, for: UIControlEvents.touchUpInside)
		}
		contentView.addSubview(check)
	}

	func btnCheckBoxClicked(_ sender:UIButton!) {
		checkBox.isChecked(!checkBox.isChecked())
		checkBox.updateImage()
	}
}

//
//  TableViewCell.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 10/8/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
	var isDeleting = false

	let icon = UIImageView()
	let checkBox = CheckBox()

	let constant = Constant()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		self.backgroundColor = constant.UIColorFromHex(constant.coralRed)
		AddLabel(textLabel!, xPosition: 100, yPosition: 72, width: 700, height: 51, text: "", font: "Arial", size: 14, color: constant.citrus)
		AddImage(icon, xPosition: ScreenSize.defaultWidth - 135, yPosition: 72, width: 35, height: 51, named: "list")
		AddCheckBox(checkBox, xPosition: ScreenSize.defaultWidth - 135, yPosition: 72, width: 51, height: 51, selector: NSSelectorFromString("btnCheckBoxClicked:"))
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
		if isDeleting {
			icon.isHidden = true
			checkBox.isHidden = false
		} else {
			icon.isHidden = false
			checkBox.isHidden = true
		}
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
		if text == "" {
			return
		}

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

	func AddCheckBox(_ check: CheckBox, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, checked: String = "", checkedImage: String = "", uncheckedImage: String = "", selector: Selector? = nil) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		check.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		check.SetCheckedImange(checkedImage)
		check.SetUncheckedImange(uncheckedImage)
		if (selector != nil) {
			checkBox.addTarget(self, action: selector!, for: UIControlEvents.touchUpInside)
		}
		contentView.addSubview(check)

		let userDefaults = UserDefaults()
		let isChecked = userDefaults.GetBool(checked)
		checkBox.isChecked(isChecked)
	}

	func btnCheckBoxClicked(_ sender:UIButton!) {
		checkBox.isChecked(!checkBox.isChecked())
		checkBox.updateImage()
	}
}

//
//  ExercisesListCell.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 10/22/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class ExercisesListCell: UITableViewCell {
	let icon = UIImageView()
	let title = UILabel()
	let listIcon = UIImageView()
	let constant = Constant()
	let checkBox = CheckBox()

	var isAdding = false
	var iconNamed = ""
	var titleText = ""
	var currentWorkoutName = ""

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		self.backgroundColor = constant.UIColorFromHex(constant.coralRed)
		AddImage(icon, xPosition: 100, yPosition: 18, width: 303, height: 303, named: "")
		AddLabel(title, xPosition: 503, yPosition: 140, width: 700, height: 59, text: titleText, font: "Arial-Bold", size: 18, color: constant.citrus)
		AddImage(listIcon, xPosition: ScreenSize.defaultWidth - 199, yPosition: 120, width: 99, height: 99, named: "list")
		AddCheckBox(checkBox, xPosition: ScreenSize.defaultWidth - 199, yPosition: 120, width: 99, height: 99, selector: NSSelectorFromString("btnCheckBoxClicked:"))
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func updateCell() {
		let image = UIImage(named: iconNamed)
		icon.image = image
		title.text = titleText
		if isAdding {
			listIcon.isHidden = true
			checkBox.isHidden = false
		} else {
			listIcon.isHidden = false
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

		let userDefaults = UserDefaults()
		let isChecked = userDefaults.GetBool(checked)
		check.isChecked(isChecked)
	}

	func btnCheckBoxClicked(_ sender:UIButton!) {
		checkBox.isChecked(!checkBox.isChecked())
		checkBox.updateImage()
		let defaults = UserDefaults()
		var array = defaults.GetArrayString(currentWorkoutName)
		if checkBox.isChecked() {
			array.append(titleText)
		} else {
			var temp = [String]()
			while array.count > 0 {
				let value = array.first
				if value != titleText {
					temp.append(value!)
				}
				array.removeFirst()
			}
			array = temp
		}
		defaults.SetArrayString(currentWorkoutName, value: array)
	}
}

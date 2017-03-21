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

    var mineHeight: CGFloat = 0
	var isAdding = false
	var iconNamed = ""
	var titleText = ""
	var workoutIndex = 0
	var currentWorkoutName = ""

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
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

	func initView() {
		self.backgroundColor = constant.UIColorFromHex(constant.coralRed)
		AddImage(icon, xPosition: 100, yPosition: 18, width: 303, height: 303, named: iconNamed)
		AddLabel(title, xPosition: 353, yPosition: 124, width: 700, height: 91, text: titleText, font: "Arial", size: 20, color: constant.citrus)
		AddImage(listIcon, xPosition: ScreenSize.defaultWidth - 145, yPosition: 136, width: 45, height: 67, named: "listExercise")
		AddCheckBox(checkBox, xPosition: ScreenSize.defaultWidth - 199, yPosition: 120, width: 99, height: 99, selector: NSSelectorFromString("btnCheckBoxClicked:"))
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

        let iconHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: 303)
        let iconX = (mineHeight - iconHeight) / 2
        icon.frame = CGRect(x: iconX, y: icon.frame.origin.y, width: icon.frame.width, height: icon.frame.height)
	}

	func AddImage(_ icon: UIImageView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, named: String) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let image = UIImage(named: named, in: Bundle(for: type(of: self)), compatibleWith: nil)!
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
		var array = defaults.GetArrayInt(currentWorkoutName)
		if checkBox.isChecked() {
			array.append(workoutIndex)
		} else {
			var temp = [Int]()
			for value in array {
				if value != workoutIndex {
					temp.append(value)
				}
			}
			array = temp
		}
		defaults.SetArrayInt(currentWorkoutName, value: array)
	}
}

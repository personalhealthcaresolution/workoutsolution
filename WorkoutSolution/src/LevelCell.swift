//
//  LevelCell.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 11/14/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class LevelCell: UITableViewCell {
	var parent = UIViewController()

	var icon1 = ""
	var textX1 = 0
	var title1 = ""
	var selector1 = ""
	var xPosition1 = 0
	var yPosition1 = 0
	var background1 = 0xF94343

	var icon2 = ""
	var textX2 = 0
	var title2 = ""
	var selector2 = ""
	var xPosition2 = 0
	var yPosition2 = 0
	var background2 = 0xF94343

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

	func initView() {
		let constant = Constant()
		backgroundColor = constant.UIColorFromHex(constant.citrus)

		let screenObject = ScreenObject()
		screenObject.AddLevelButton(contentView, xPosition: CGFloat(xPosition1), yPosition: CGFloat(yPosition1), width: 620, height: 580, title: title1, textX: CGFloat(textX1), background: UInt32(background1), icon: icon1, parent: parent, selector: NSSelectorFromString(selector1 + ":"))
		screenObject.AddLevelButton(contentView, xPosition: CGFloat(xPosition2), yPosition: CGFloat(yPosition2), width: 620, height: 580, title: title2, textX: CGFloat(textX2), background: UInt32(background2), icon: icon2, parent: parent, selector: NSSelectorFromString(selector2 + ":"))
	}
}

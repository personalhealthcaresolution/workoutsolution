//
//  LevelCell.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 11/14/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class LevelCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		let constant = Constant()
		backgroundColor = constant.UIColorFromHex(constant.citrus)

		let screenObject = ScreenObject()
		screenObject.AddLevelButton(contentView, xPosition: 0, yPosition: 0, width: 620, height: 580, title: "BEGINNER", textX: 100, background: 0xF94343, icon: "absBeginner")
		screenObject.AddLevelButton(contentView, xPosition: 622, yPosition: 0, width: 620, height: 580, title: "INTERMEDIATE", textX: 15, background: 0xF94343, icon: "beginner")
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

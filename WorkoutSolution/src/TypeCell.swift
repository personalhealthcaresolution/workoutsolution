//
//  TypeCell.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 11/18/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class TypeCell: UITableViewCell {
	var iconNamed = ""
	var titleText = ""

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
		let button = TypeButton()
		button.UpdateButton()
	}
}

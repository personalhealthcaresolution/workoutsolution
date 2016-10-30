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
        AddLabel(title, xPosition: 100, yPosition: 30, width: 200, height: 60, text: "Back", font: "Arial", size: 15, color: constant.coralRed)
        AddImage(icon, xPosition: 0, yPosition: 0, width: 120, height: 120, named: "back")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func UpdateButton() {
        let image = UIImage(named: imageText)
        icon.image = image
        title.frame.origin.x = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: textX)
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
        addSubview(label)
        
    }
    
    func AddImage(_ icon: UIImageView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, named: String) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)
        
        let image = UIImage(named: named)
        icon.image = image
        icon.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
        addSubview(icon)
    }
}

//
//  Level.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 6/8/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Level: UIViewController {
    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0
    let statusHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height

    override func viewDidLoad() {
        super.viewDidLoad()

        screenWidth = self.view.frame.size.width
        screenHeight = self.view.frame.size.height
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initView() {
        addBackground(0, yPosition: 80, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: Color.citrus)
        addButton(70, yPosition: 83, width: 140, height: 140, icon: "back")

        //absBeginner
        addBackground(0, yPosition: 203, width: 592, height: 592, color: Color.coralRed)
        addLabel(41, yPosition: 273, width: 510, height: 100, text: "ABSOLUTE BEGINNER", font: Font.helveticaNeueBold, size: 12, color: Color.citrus)
        addButton(121, yPosition: 375, width: 350, height: 350, icon: "absBeginner")

        //beginner
        addBackground(650, yPosition: 203, width: 592, height: 592, color: Color.coralRed)
        addLabel(821, yPosition: 273, width: 250, height: 100, text: "BEGINNER", font: Font.helveticaNeueBold, size: 12, color: Color.citrus)
        addButton(771, yPosition: 375, width: 350, height: 350, icon: "beginner")

        //advanced
        addBackground(0, yPosition: 853, width: 592, height: 592, color: Color.coralRed)
        addLabel(166, yPosition: 923, width: 260, height: 100, text: "ADVANCED", font: Font.helveticaNeueBold, size: 12, color: Color.citrus)
        addButton(121, yPosition: 1025, width: 350, height: 350, icon: "advanced")

        //intermediate
        addBackground(650, yPosition: 853, width: 592, height: 592, color: Color.coralRed)
        addLabel(771, yPosition: 923, width: 350, height: 100, text: "INTERMEDIATE", font: Font.helveticaNeueBold, size: 12, color: Color.citrus)
        addButton(771, yPosition: 1025, width: 350, height: 350, icon: "intermediate")

        //cardio
        addLabel((ScreenSize.defaultWidth - 280) / 2, yPosition: 1495, width: 280, height: 100, text: "CARDIO", font: Font.helveticaNeueBold, size: 18, color: Color.white)
        addButton((ScreenSize.defaultWidth - 350) / 2, yPosition: 1645, width: 350, height: 350, icon: "cardio")
    }

    func addBackground(xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, color: UInt32) {
        let positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        let positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)

        let background = UILabel()
        background.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        background.backgroundColor = Color.UIColorFromHex(color)
        self.view.addSubview(background)
    }

    func addLabel(xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, text: String, font: String, size: CGFloat, color: UInt32) {
        let positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        let positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)

        let label = UILabel()
        label.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        label.text = text
        label.font = UIFont(name: font, size: size)
        label.textColor = Color.UIColorFromHex(color)
        self.view.addSubview(label)

    }

    func addButton(xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, icon: String) {
        let positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        let positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)

        let button = UIButton()
        button.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        button.setImage(UIImage(named: icon), forState: UIControlState.Normal)
        self.view.addSubview(button)
    }
}
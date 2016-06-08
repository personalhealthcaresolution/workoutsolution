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
        var width: CGFloat = 0
        var height: CGFloat = 0
        var xPosition: CGFloat = 0
        var yPosition: CGFloat = 0

        var positionX: CGFloat = 0
        var positionY: CGFloat = 0
        var itemWidth: CGFloat = 0
        var itemHeight: CGFloat = 0

        width = ScreenSize.defaultWidth
        height = ScreenSize.defaultHeight
        xPosition = 0
        yPosition = 80
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let background = UILabel()
        background.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        background.backgroundColor = Color.UIColorFromHex(Color.citrus)
        self.view.addSubview(background)
        
        width = 140
        height = 140
        xPosition = 70
        yPosition = 83
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let btnBack = UIButton()
        btnBack.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        btnBack.setImage(UIImage(named: "back"), forState: UIControlState.Normal)
        self.view.addSubview(btnBack)

        width = 592
        height = 592
        xPosition = 0
        yPosition = 203
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let backgroundAbsBeginner = UILabel()
        backgroundAbsBeginner.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        backgroundAbsBeginner.backgroundColor = Color.UIColorFromHex(Color.coralRed)
        self.view.addSubview(backgroundAbsBeginner)

        width = 510
        height = 100
        xPosition = 41
        yPosition = 273
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let labelAbsBeginner = UILabel()
        labelAbsBeginner.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        labelAbsBeginner.text = "ABSOLUTE BEGINNER"
        labelAbsBeginner.font = UIFont(name: Font.helveticaNeueBold, size: 12)
        labelAbsBeginner.textColor = Color.UIColorFromHex(Color.citrus)
        self.view.addSubview(labelAbsBeginner)

        width = 350
        height = 350
        xPosition = 121
        yPosition = 375
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let btnAbsBeginner = UIButton()
        btnAbsBeginner.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        btnAbsBeginner.setImage(UIImage(named: "absBeginner"), forState: UIControlState.Normal)
        self.view.addSubview(btnAbsBeginner)

        width = 592
        height = 592
        xPosition = 650
        yPosition = 203
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let backgroundBeginner = UILabel()
        backgroundBeginner.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        backgroundBeginner.backgroundColor = Color.UIColorFromHex(Color.coralRed)
        self.view.addSubview(backgroundBeginner)

        width = 250
        height = 100
        xPosition = 821
        yPosition = 273
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let labelBeginner = UILabel()
        labelBeginner.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        labelBeginner.text = "BEGINNER"
        labelBeginner.font = UIFont(name: Font.helveticaNeueBold, size: 12)
        labelBeginner.textColor = Color.UIColorFromHex(Color.citrus)
        self.view.addSubview(labelBeginner)

        width = 350
        height = 350
        xPosition = 771
        yPosition = 375
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let btnBeginner = UIButton()
        btnBeginner.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        btnBeginner.setImage(UIImage(named: "beginner"), forState: UIControlState.Normal)
        self.view.addSubview(btnBeginner)

        width = 592
        height = 592
        xPosition = 0
        yPosition = 853
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let backgroundAdvanced = UILabel()
        backgroundAdvanced.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        backgroundAdvanced.backgroundColor = Color.UIColorFromHex(Color.coralRed)
        self.view.addSubview(backgroundAdvanced)

        width = 260
        height = 100
        xPosition = 166
        yPosition = 923
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let labelAdvanced = UILabel()
        labelAdvanced.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        labelAdvanced.text = "ADVANCED"
        labelAdvanced.font = UIFont(name: Font.helveticaNeueBold, size: 12)
        labelAdvanced.textColor = Color.UIColorFromHex(Color.citrus)
        self.view.addSubview(labelAdvanced)

        width = 350
        height = 350
        xPosition = 121
        yPosition = 1025
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let btnAdvanced = UIButton()
        btnAdvanced.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        btnAdvanced.setImage(UIImage(named: "advanced"), forState: UIControlState.Normal)
        self.view.addSubview(btnAdvanced)
        
        width = 592
        height = 592
        xPosition = 650
        yPosition = 853
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let backgroundIntermediate = UILabel()
        backgroundIntermediate.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        backgroundIntermediate.backgroundColor = Color.UIColorFromHex(Color.coralRed)
        self.view.addSubview(backgroundIntermediate)

        width = 350
        height = 100
        xPosition = 771
        yPosition = 923
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let labelIntermediate = UILabel()
        labelIntermediate.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        labelIntermediate.text = "INTERMEDIATE"
        labelIntermediate.font = UIFont(name: Font.helveticaNeueBold, size: 12)
        labelIntermediate.textColor = Color.UIColorFromHex(Color.citrus)
        self.view.addSubview(labelIntermediate)

        width = 350
        height = 350
        xPosition = 771
        yPosition = 1025
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let btnIntermediate = UIButton()
        btnIntermediate.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        btnIntermediate.setImage(UIImage(named: "intermediate"), forState: UIControlState.Normal)
        self.view.addSubview(btnIntermediate)

        width = 280
        height = 100
        xPosition = (ScreenSize.defaultWidth - width) / 2
        yPosition = 1495
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let labelCardio = UILabel()
        labelCardio.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        labelCardio.text = "CARDIO"
        labelCardio.font = UIFont(name: Font.helveticaNeueBold, size: 18)
        labelCardio.textColor = Color.UIColorFromHex(Color.white)
        self.view.addSubview(labelCardio)
    }
}
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

        width = 1080
        height = 1920
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
        
        width = 120
        height = 120
        xPosition = 60
        yPosition = 80
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let btnBack = UIButton()
        btnBack.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        btnBack.setImage(UIImage(named: "back"), forState: UIControlState.Normal)
        self.view.addSubview(btnBack)
    }
}
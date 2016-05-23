//
//  Type.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 5/16/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Type: UIViewController {
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

    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        let swap = screenWidth
        screenWidth = screenHeight
        screenHeight = swap
        initView()
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

        width = 1080
        height = 325
        xPosition = 0
        yPosition = 200
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let backgroundUpper = UILabel()
        backgroundUpper.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        backgroundUpper.backgroundColor = Color.UIColorFromHex(Color.coralRed)
        self.view.addSubview(backgroundUpper)

        width = 305
        height = 305
        xPosition = 80
        yPosition = 210
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let btnUpper = UIButton()
        btnUpper.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        btnUpper.setImage(UIImage(named: "upper"), forState: UIControlState.Normal)
        self.view.addSubview(btnUpper)

        width = 1080
        height = 325
        xPosition = 0
        yPosition = 561
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let backgroundLower = UILabel()
        backgroundLower.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        backgroundLower.backgroundColor = Color.UIColorFromHex(Color.coralRed)
        self.view.addSubview(backgroundLower)

        width = 305
        height = 305
        xPosition = 80
        yPosition = 571
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let btnLower = UIButton()
        btnLower.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        btnLower.setImage(UIImage(named: "lower"), forState: UIControlState.Normal)
        self.view.addSubview(btnLower)

        width = 1080
        height = 325
        xPosition = 0
        yPosition = 925
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let backgroundCoreAbs = UILabel()
        backgroundCoreAbs.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        backgroundCoreAbs.backgroundColor = Color.UIColorFromHex(Color.coralRed)
        self.view.addSubview(backgroundCoreAbs)

        width = 305
        height = 305
        xPosition = 80
        yPosition = 935
        positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        let btnCoreAbs = UIButton()
        btnCoreAbs.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        btnCoreAbs.setImage(UIImage(named: "coreAbs"), forState: UIControlState.Normal)
        self.view.addSubview(btnCoreAbs)
    }
}
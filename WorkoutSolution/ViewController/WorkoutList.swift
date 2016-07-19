//
//  WorkoutList.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/18/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class WorkoutList: UIViewController {
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
    }

    func initView() {
        addBackground(0, yPosition: 80, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: Color.citrus)
        addButton(70, yPosition: 83, width: 140, height: 140, icon: "back", selector: #selector(WorkoutList.btnBackClicked(_:)))

        addBackground(0, yPosition: 220, width: ScreenSize.defaultWidth, height: 344, color: Color.coralRed)
        addButton(100, yPosition: 240, width: 304, height: 304, icon: "chinups")
        addLabel(440, yPosition: 310, width: 280, height: 164, text: "CHINUP", font: Font.helveticaNeueBold, size: 18, color: Color.citrus)

        addBackground(0, yPosition: 595, width: ScreenSize.defaultWidth, height: 344, color: Color.coralRed)
        addButton(100, yPosition: 615, width: 304, height: 304, icon: "wallSix")
        addLabel(440, yPosition: 685, width: 350, height: 164, text: "WALL SIX", font: Font.helveticaNeueBold, size: 18, color: Color.citrus)

        addBackground(0, yPosition: 970, width: ScreenSize.defaultWidth, height: 344, color: Color.coralRed)
        addButton(100, yPosition: 990, width: 304, height: 304, icon: "dipOnChair")
        addLabel(440, yPosition: 1060, width: 500, height: 164, text: "DIP ON CHAIR", font: Font.helveticaNeueBold, size: 18, color: Color.citrus)

        addBackground(0, yPosition: 1345, width: ScreenSize.defaultWidth, height: 344, color: Color.coralRed)
        addButton(100, yPosition: 1365, width: 304, height: 304, icon: "squats")
        addLabel(440, yPosition: 1435, width: 280, height: 164, text: "SQUAT", font: Font.helveticaNeueBold, size: 18, color: Color.citrus)

        addBackground(0, yPosition: 1720, width: ScreenSize.defaultWidth, height: 344, color: Color.coralRed)
        addButton(100, yPosition: 1740, width: 304, height: 304, icon: "pushUp")
        addLabel(440, yPosition: 1810, width: 320, height: 164, text: "PUSH UP", font: Font.helveticaNeueBold, size: 18, color: Color.citrus)

        addButton(112, yPosition: 2076, width: 90, height: 90, icon: "exercises")
        addLabel(112, yPosition: 2166, width: 320, height: 30, text: "Exercises", font: Font.helveticaNeueBold, size: 5, color: Color.white)

        addButton(412, yPosition: 2076, width: 90, height: 90, icon: "workouts")
        addLabel(412, yPosition: 2166, width: 320, height: 30, text: "Workouts", font: Font.helveticaNeueBold, size: 5, color: Color.white)

        addButton(712, yPosition: 2076, width: 90, height: 90, icon: "tracker")
        addLabel(722, yPosition: 2166, width: 320, height: 30, text: "Tracker", font: Font.helveticaNeueBold, size: 5, color: Color.white)

        addButton(1012, yPosition: 2076, width: 90, height: 90, icon: "setting")
        addLabel(1022, yPosition: 2166, width: 320, height: 30, text: "Settings", font: Font.helveticaNeueBold, size: 5, color: Color.white)
    }

    func btnBackClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showType", sender: self)
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
    
    func addImage(xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, named: String) {
        let positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        let positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        
        let image = UIImage(named: named)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        self.view.addSubview(imageView)
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
    
    func addButton(xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, icon: String, selector: Selector = nil) {
        let positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        let positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        
        let button = UIButton()
        button.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        button.setImage(UIImage(named: icon), forState: UIControlState.Normal)
        button.addTarget(self, action: selector, forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
}
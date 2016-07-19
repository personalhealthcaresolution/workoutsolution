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
        addBackground(0, yPosition: 80, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: Color.citrus)
        addButton(70, yPosition: 83, width: 140, height: 140, icon: "back", selector: #selector(Type.btnBackClicked(_:)))

        addBackground(0, yPosition: 223, width: ScreenSize.defaultWidth, height: 380, color: Color.coralRed)
        addButton(104, yPosition: 262, width: 302, height: 302, icon: "upper", selector: #selector(Type.btnUpperClicked(_:)))
        addLabel(536, yPosition: 389, width: 619, height: 48, text: "UPPER BODY", font: Font.helveticaNeueBold, size: 15, color: Color.citrus)

        addBackground(0, yPosition: 638, width: ScreenSize.defaultWidth, height: 380, color: Color.coralRed)
        addButton(104, yPosition: 677, width: 302, height: 302, icon: "lower", selector: #selector(Type.btnLowerClicked(_:)))
        addLabel(536, yPosition: 804, width: 619, height: 48, text: "LOWER BODY", font: Font.helveticaNeueBold, size: 15, color: Color.citrus)

        addBackground(0, yPosition: 1053, width: ScreenSize.defaultWidth, height: 380, color: Color.coralRed)
        addButton(104, yPosition: 1092, width: 302, height: 302, icon: "coreAbs", selector: #selector(Type.btnCoreAbsClicked(_:)))
        addLabel(536, yPosition: 1219, width: 619, height: 48, text: "CORE ABS", font: Font.helveticaNeueBold, size: 15, color: Color.citrus)

        addLabel(104, yPosition: 1707, width: 619, height: 100, text: "CARDIO", font: Font.helveticaNeueBold, size: 20, color: Color.white)
        addButton(723, yPosition: 1547, width: 419, height: 419, icon: "cardio")
    }

    func btnBackClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showMain", sender: self)
    }

    func btnUpperClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showWorkout", sender: self)
    }

    func btnLowerClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showWorkout", sender: self)
    }

    func btnCoreAbsClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showWorkout", sender: self)
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
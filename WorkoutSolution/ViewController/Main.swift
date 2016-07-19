//
//  Main.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 5/10/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Main: UIViewController {
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
        //initView()
    }
    
    func initView() {
        addBackground(0, yPosition: 80, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: Color.coralRed)
        addBackground(0, yPosition: 80, width: ScreenSize.defaultWidth, height: 140, color: Color.citrus)
        addButton(70, yPosition: 83, width: 140, height: 140, icon: "back")

        addImage(100, yPosition: 563, width: 1042, height: 150, named: "calisthenics")

        addLabel(351, yPosition: 1103, width: 540, height: 100, text: "CHOOSE BY", font: Font.helveticaNeueBold, size: 23, color: Color.citrus)

        addButton(380, yPosition: 1283, width: 300, height: 300, icon: "type", selector: #selector(Main.btnTypeClicked(_:)))
        addLabel(730, yPosition: 1403, width: 540, height: 60, text: "TYPE", font: Font.helveticaNeueBold, size: 20, color: Color.white)

        addButton(380, yPosition: 1613, width: 300, height: 300, icon: "level", selector: #selector(Main.btnLevelClicked(_:)))
        addLabel(730, yPosition: 1733, width: 540, height: 60, text: "LEVEL", font: Font.helveticaNeueBold, size: 20, color: Color.white)
    }

    func btnTypeClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showType", sender: self)
    }

    func btnLevelClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showLevel", sender: self)        
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
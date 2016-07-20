//
//  ScreenObject.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/20/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import Foundation

class ScreenObject {
    class func addBackground(view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, color: UInt32, screenWidth: CGFloat, screenHeight: CGFloat) {
        let positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        let positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        
        let background = UILabel()
        background.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        background.backgroundColor = Color.UIColorFromHex(color)
        view.view.addSubview(background)
    }
    
    class func addImage(view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, named: String, screenWidth: CGFloat, screenHeight: CGFloat) {
        let positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        let positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        
        let image = UIImage(named: named)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        view.view.addSubview(imageView)
    }
    
    class func addLabel(view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, text: String, font: String, size: CGFloat, color: UInt32, screenWidth: CGFloat, screenHeight: CGFloat) {
        let positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        let positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        
        let label = UILabel()
        label.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        label.text = text
        label.font = UIFont(name: font, size: size)
        label.textColor = Color.UIColorFromHex(color)
        view.view.addSubview(label)
        
    }
    
    class func addButton(view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, icon: String, screenWidth: CGFloat, screenHeight: CGFloat, selector: Selector = nil) {
        let positionX = ScreenSize.getPositionX(screenWidth, positionX: xPosition)
        let positionY = ScreenSize.getPositionY(screenHeight, positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(screenWidth, itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(screenHeight, itemHeight: height)
        
        let button = UIButton()
        button.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        button.setImage(UIImage(named: icon), forState: UIControlState.Normal)
        button.addTarget(view, action: selector, forControlEvents: UIControlEvents.TouchUpInside)
        view.view.addSubview(button)
    }
}
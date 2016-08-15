//
//  ScreenObject.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/20/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit
import Foundation

class ScreenObject: NSObject, NSXMLParserDelegate {
    var object = Object()
    var objects: [Object] = []
    var curObject: Int = 0
    var isParsing: Bool = false
    var curElement: String = ""
    var didStartElement: Bool = false

    struct Object {
        var type: String = ""
        var icon: String = ""
        var font: String = ""
        var text: String = ""
        var size: CGFloat = 0
        var named: String = ""
        var color: UInt32 = 0
        var width: CGFloat = 0
        var height: CGFloat = 0
        var selector: String = ""
        var xPosition: CGFloat = 0
        var yPosition: CGFloat = 0
    }

    func getObjects(xmlFile: String) -> [Object] {
        objects = []
        curObject = 0
        isParsing = true

        let path = NSBundle.mainBundle().pathForResource(xmlFile, ofType: "xml")
        let data = NSData.init(contentsOfFile: path!)
        let parser = NSXMLParser(data: data!)
        parser.delegate = self
        parser.parse()

        while isParsing {}

        return objects
    }

    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        curElement = elementName
        didStartElement = true
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if didStartElement {
            switch curElement {
            case "type":
                object.type = string
            case "icon":
                object.icon = string
            case "text":
                object.text = string
            case "font":
                object.font = string
            case "selector":
                object.selector = string
            case "size":
                if let temp = NSNumberFormatter().numberFromString(string) {
                    object.size = CGFloat(temp)
                }
            case "named":
                object.named = string
            case "color":
                object.color = getColor(string)
            case "posX":
                if let temp = NSNumberFormatter().numberFromString(string) {
                    object.xPosition = CGFloat(temp)
                }
            case "posY":
                if let temp = NSNumberFormatter().numberFromString(string) {
                    object.yPosition = CGFloat(temp)
                }
            case "width":
                if string == "full" {
                    object.width = ScreenSize.defaultWidth
                } else if let temp = NSNumberFormatter().numberFromString(string) {
                    object.width = CGFloat(temp)
                }
            case "height":
                if string == "full" {
                    object.height = ScreenSize.defaultHeight
                } else if let temp = NSNumberFormatter().numberFromString(string) {
                    object.height = CGFloat(temp)
                }
            default:
                return
            }
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        didStartElement = false
        if elementName == "object" {
            objects.append(object)
        } else if elementName == "view" {
            isParsing = false
        }
    }
    
    func getColor(value: String) -> UInt32 {
        var color: UInt32
        switch value {
        case "0xffffff":
            color = Constant.white
        case "0x373639":
            color = Constant.citrus
        case "0xF94343":
            color = Constant.coralRed
        default:
            color = Constant.coralRed
        }
        return color
    }

    class func addBackground(view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, color: UInt32) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)
        
        let background = UILabel()
        background.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        background.backgroundColor = Constant.UIColorFromHex(color)
        view.view.addSubview(background)
    }
    
    class func addImage(view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, named: String) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)
        
        let image = UIImage(named: named)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        view.view.addSubview(imageView)
    }
    
    class func addLabel(view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, text: String, font: String, size: CGFloat, color: UInt32) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)
        
        let label = UILabel()
        label.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        label.text = text
        label.font = UIFont(name: font, size: size)
        label.textColor = Constant.UIColorFromHex(color)
        view.view.addSubview(label)
        
    }
    
    class func addButton(view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, icon: String = "", background: String = "", title: String = "", titleColor: UIColor = UIColor.whiteColor(), selector: Selector = nil) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)
        
        let button = UIButton()
        button.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        button.setImage(UIImage(named: icon), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: background), forState: UIControlState.Normal)
        button.setTitle(title, forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.addTarget(view, action: selector, forControlEvents: UIControlEvents.TouchUpInside)
        view.view.addSubview(button)
    }
}
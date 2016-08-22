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

    struct Object {
        var tab: String = ""
        var type: String = ""
        var icon: String = ""
        var font: String = ""
        var text: String = ""
        var size: CGFloat = 0
        var named: String = ""
        var color: UInt32 = 0
        var width: CGFloat = 0
        var height: CGFloat = 0
        var selector: Selector = Selector()
        var xPosition: CGFloat = 0
        var yPosition: CGFloat = 0
        var selectorRaw: String = ""
    }

    var object = Object()
    var objects: [Object] = []
    var constant = Constant()
    var curObject: Int = 0
    var isParsing: Bool = false
    var curElement: String = ""
    var didStartElement: Bool = false

    func GetObjects(xmlFile: String) -> [Object] {
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
        if elementName == "object" {
            object = Object()
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if didStartElement {
            switch curElement {
            case "tab":
                object.tab = string
            case "type":
                object.type = string
            case "icon":
                object.icon = string
            case "text":
                object.text = string
            case "font":
                object.font = string
            case "selector":
                object.selectorRaw = string
            case "size":
                if let temp = NSNumberFormatter().numberFromString(string) {
                    object.size = CGFloat(temp)
                }
            case "named":
                object.named = string
            case "color":
                object.color = GetColor(string)
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
    
    func GetColor(value: String) -> UInt32 {
        switch value {
        case "0xffffff":
            return constant.white
        case "0x373639":
            return constant.citrus
        case "0xF94343":
            return constant.coralRed
        default:
            return constant.coralRed
        }
    }

    func DrawScreen(view: UIViewController, currentTab: String = "") {
        while objects.count > 0 {
            var canDraw: Bool = true
            var object = ScreenObject.Object()
            object = objects.first!
            if object.tab == "" {
                canDraw = true
            } else {
                if object.tab == "all" {
                    canDraw = true
                } else if object.tab == currentTab {
                    canDraw = true
                } else {
                    canDraw = false
                }
            }
            switch object.type {
            case "background":
                if canDraw {
                    AddBackground(view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, color: object.color)
                }
            case "button":
                if canDraw {
                    AddButton(view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, icon: object.icon, selector: object.selector)
                }
            case "image":
                if canDraw {
                    AddImage(view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, named: object.named)
                }
            case "label":
                if canDraw {
                    AddLabel(view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, text: object.text, font: object.font, size: object.size, color: object.color)
                }
            default:
                break
            }
            objects.removeFirst()
        }
    }

    func AddBackground(view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, color: UInt32) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)
        
        let background = UILabel()
        background.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        background.backgroundColor = constant.UIColorFromHex(color)
        view.view.addSubview(background)
    }
    
    func AddImage(view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, named: String) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)
        
        let image = UIImage(named: named)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        view.view.addSubview(imageView)
    }
    
    func AddLabel(view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, text: String, font: String, size: CGFloat, color: UInt32) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)
        
        let label = UILabel()
        label.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
        label.text = text
        label.font = UIFont(name: font, size: size)
        label.textColor = constant.UIColorFromHex(color)
        view.view.addSubview(label)
        
    }
    
    func AddButton(view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, icon: String = "", background: String = "", title: String = "", titleColor: UIColor = UIColor.whiteColor(), selector: Selector = nil) {
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
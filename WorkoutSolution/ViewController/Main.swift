//
//  Main.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 5/10/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Main: UIViewController, NSXMLParserDelegate {
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
    var curElement: String = ""
    var didStartElement: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        ScreenSize.setStatusHeight(UIApplication.sharedApplication().statusBarFrame.size.height)
        ScreenSize.setCurrentWidth(self.view.frame.size.width)
        ScreenSize.setCurrentHeight(self.view.frame.size.height)
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        let swap = ScreenSize.getCurrentWidth()
        ScreenSize.setCurrentWidth(ScreenSize.getCurrentHeight())
        ScreenSize.setCurrentHeight(swap)
        //initView()
    }
    
    func initView() {
        let path = NSBundle.mainBundle().pathForResource("main", ofType: "xml")
        let data = NSData.init(contentsOfFile: path!)
        let parser = NSXMLParser(data: data!)
        parser.delegate = self
        parser.parse()

        //ScreenObject.addButton(self, xPosition: 380, yPosition: 1663, width: 225, height: 225, icon: "level", selector: #selector(Main.btnLevelClicked(_:)))
    }

    func btnTypeClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showType", sender: self)
    }

    func btnLevelClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showLevel", sender: self)        
    }

    //XMLParser Methods
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        curElement = elementName
        didStartElement = true
        if curElement == "object" {
            print("start object")
        }
    }

    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if didStartElement {
            switch curElement {
            case "type":
                type = string
            case "icon":
                icon = string
            case "text":
                text = string
            case "font":
                font = string
            case "selector":
                selector = string
            case "size":
                if let temp = NSNumberFormatter().numberFromString(string) {
                    size = CGFloat(temp)
                }
            case "named":
                named = string
            case "color":
                color = getColor(string)
            case "posX":
                if let temp = NSNumberFormatter().numberFromString(string) {
                    xPosition = CGFloat(temp)
                }
            case "posY":
                if let temp = NSNumberFormatter().numberFromString(string) {
                    yPosition = CGFloat(temp)
                }
            case "width":
                if string == "full" {
                    width = ScreenSize.defaultWidth
                } else if let temp = NSNumberFormatter().numberFromString(string) {
                    width = CGFloat(temp)
                }
            case "height":
                if string == "full" {
                    height = ScreenSize.defaultHeight
                } else if let temp = NSNumberFormatter().numberFromString(string) {
                    height = CGFloat(temp)
                }
            default:
                return
            }
        }
    }

    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        didStartElement = false
        if elementName == "object" {
            print("end object")
            switch type {
            case "background":
                ScreenObject.addBackground(self, xPosition: xPosition, yPosition: yPosition, width: width, height: height, color: color)
            case "button":
                ScreenObject.addButton(self, xPosition: xPosition, yPosition: yPosition, width: width, height: height, icon: icon, selector: getSelector(selector))
            case "image":
                ScreenObject.addImage(self, xPosition: xPosition, yPosition: yPosition, width: width, height: height, named: named)
            case "label":
                ScreenObject.addLabel(self, xPosition: xPosition, yPosition: yPosition, width: width, height: height, text: text, font: font, size: size, color: color)
            default:
                return
            }
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

    func getSelector(value: String) -> Selector {
        switch value {
        case "btnTypeClicked":
            return #selector(Main.btnTypeClicked(_:))
        case "btnLevelClicked":
            return #selector(Main.btnLevelClicked(_:))
        default:
            return nil
        }
    }
}
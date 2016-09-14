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
		var font = ""
		var icon = ""
		var text = ""
		var type = ""
		var named = ""
		var status = ""
		var checked = ""
		var unchecked = ""
		var background = ""

		var size: CGFloat = 0
		var width: CGFloat = 0
		var height: CGFloat = 0
		var xPosition: CGFloat = 0
		var yPosition: CGFloat = 0

		var color: UInt32 = 0
		var selector = Selector()
		var isChecked = false
    }

    var object = Object()
    var objects: [Object] = []
    var constant = Constant()
    var curObject: Int = 0
    var isParsing: Bool = false
    var curElement: String = ""
    var didStartElement: Bool = false

	func ParseXML(xmlFile: String) {
		let path = NSBundle.mainBundle().pathForResource(xmlFile, ofType: "xml")
		let data = NSData.init(contentsOfFile: path!)
		let parser = NSXMLParser(data: data!)
		parser.delegate = self
		parser.parse()

		while isParsing {}
	}

	func GetIcon(value: String) -> String {
		var iconID = ""
		if value.containsString("WorkoutIcon") {
			switch Application.instance.CurrentWorkout() {
			case Application.WorkoutsList.LOWER:
				iconID = "Lower" + value
			case Application.WorkoutsList.UPPER:
				iconID = "Upper" + value
			case Application.WorkoutsList.CORE_ABS:
				iconID = "CoreAbs" + value
			}
			let userDefaults = UserDefaults()
			let result = userDefaults.GetString(iconID)
			return result
		} else {
			return value
		}
	}

	func GetText(value: String) -> String {
		var textID = ""
		if value.containsString("WorkoutText") {
			switch Application.instance.CurrentWorkout() {
			case Application.WorkoutsList.LOWER:
				textID = "Lower" + value
			case Application.WorkoutsList.UPPER:
				textID = "Upper" + value
			case Application.WorkoutsList.CORE_ABS:
				textID = "CoreAbs" + value
			}
			let userDefaults = UserDefaults()
			let result = userDefaults.GetString(textID)
			return result
		} else {
			return value
		}
	}

    func GetObjects() -> [Object] {
        return objects
    }

	func GetSelector(value: String) -> Selector{
		return NSSelectorFromString(value + ":")
	}

	func GetScreenSize(value: String) -> CGFloat {
		switch value {
		case "width":
			return ScreenSize.defaultWidth
		case "height":
			return ScreenSize.defaultHeight
		default:
			return StringToCGFloat(value)
		}
	}

	func StringToCGFloat(value: String) -> CGFloat {
		let result = NSNumberFormatter().numberFromString(value)
		if result != nil {
			return CGFloat(result!)
		} else {
			return 0
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
			var object = ScreenObject.Object()
			object = objects.first!
			switch object.type {
			case "background":
				AddBackground(view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, color: object.color)
			case "button":
				AddButton(view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, icon: object.icon, selector: object.selector, background: object.background)
			case "image":
				AddImage(view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, named: object.named)
			case "label":
				AddLabel(view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, text: object.text, font: object.font, size: object.size, color: object.color)
			case "check":
				AddCheckBox(view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, checked: object.status, selector: object.selector, checkedImage: object.checked, uncheckedImage: object.unchecked)
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
		if text == "" {
			return
		}

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

	func AddCheckBox(view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, checked: String = "", checkedImage: String = "", uncheckedImage: String = "", selector: Selector = nil) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let checkBox = CheckBox()
		checkBox.frame = CGRectMake(positionX, positionY, itemWidth, itemHeight)
		checkBox.addTarget(view, action: selector, forControlEvents: UIControlEvents.TouchUpInside)
		checkBox.SetCheckedImange(checkedImage)
		checkBox.SetUncheckedImange(uncheckedImage)
		view.view.addSubview(checkBox)

		let userDefaults = UserDefaults()
		let isChecked = userDefaults.GetBool(checked)
		checkBox.isChecked(isChecked)
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
			case "font":
				object.font = string
			case "icon":
				object.icon = GetIcon(string)
			case "text":
				object.text = GetText(string)
            case "type":
                object.type = string
			case "named":
				object.named = string
			case "status":
				object.status = string
			case "checked":
				object.checked = string
			case "unchecked":
				object.unchecked = string
			case "background":
				object.background = string

            case "size":
				object.size = StringToCGFloat(string)
            case "width":
				object.width = GetScreenSize(string)
            case "height":
                object.height = GetScreenSize(string)
			case "posX":
				object.xPosition = StringToCGFloat(string)
			case "posY":
				object.yPosition = StringToCGFloat(string)

			case "color":
				object.color = GetColor(string)
			case "selector":
				object.selector = GetSelector(string)
				if object.type == "check" {
					object.status = string
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
}
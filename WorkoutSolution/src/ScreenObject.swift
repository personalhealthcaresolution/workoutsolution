//
//  ScreenObject.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/20/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit
import Foundation

class ScreenObject: NSObject, XMLParserDelegate {
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
		var selector: Selector!
		var isChecked = false
    }

    var object = Object()
    var objects: [Object] = []
    var constant = Constant()
    var curObject: Int = 0
    var isParsing: Bool = false
    var curElement: String = ""
    var didStartElement: Bool = false

	func ParseXML(_ xmlFile: String) {
		let path = Bundle.main.path(forResource: xmlFile, ofType: "xml")
		let data = try? Data.init(contentsOf: URL(fileURLWithPath: path!))
		let parser = XMLParser(data: data!)
		parser.delegate = self
		parser.parse()

		while isParsing {}
	}

	func GetIcon(_ value: String) -> String {
		var iconID = ""
		if value.contains("WorkoutIcon") || value.contains("WorkoutList") {
			switch Application.instance.CurrentWorkout() {
			case Application.Workouts.type:
				switch Application.instance.CurrentWorkoutType() {
				case Application.WorkoutsType.lower:
					iconID = "Lower" + value
				case Application.WorkoutsType.upper:
					iconID = "Upper" + value
				case Application.WorkoutsType.coreAbs:
					iconID = "CoreAbs" + value
				}
			case Application.Workouts.level:
				switch Application.instance.CurrentWorkoutLevel() {
				case Application.WorkoutsLevel.beginner:
					iconID = "Beginner" + value
				case Application.WorkoutsLevel.intermediate:
					iconID = "Intermediate" + value
				case Application.WorkoutsLevel.advanced:
					iconID = "Advanced" + value
				case Application.WorkoutsLevel.expert:
					iconID = "Expert" + value
				}
			}
			let userDefaults = UserDefaults()
			let result = userDefaults.GetString(iconID)
			return result
		} else {
			return value
		}
	}

	func GetText(_ value: String) -> String {
		var textID = ""
		if value.contains("WorkoutText") {
			switch Application.instance.CurrentWorkout() {
			case Application.Workouts.type:
				switch Application.instance.CurrentWorkoutType() {
				case Application.WorkoutsType.lower:
					textID = "Lower" + value
				case Application.WorkoutsType.upper:
					textID = "Upper" + value
				case Application.WorkoutsType.coreAbs:
					textID = "CoreAbs" + value
				}
			case Application.Workouts.level:
				switch Application.instance.CurrentWorkoutLevel() {
				case Application.WorkoutsLevel.beginner:
					textID = "Beginner" + value
				case Application.WorkoutsLevel.intermediate:
					textID = "Intermediate" + value
				case Application.WorkoutsLevel.advanced:
					textID = "Advanced" + value
				case Application.WorkoutsLevel.expert:
					textID = "Expert" + value
				}
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

	func GetSelector(_ value: String) -> Selector{
		return NSSelectorFromString(value + ":")
	}

	func GetScreenSize(_ value: String) -> CGFloat {
		switch value {
		case "width":
			return ScreenSize.defaultWidth
		case "height":
			return ScreenSize.defaultHeight
		default:
			return StringToCGFloat(value)
		}
	}

	func StringToCGFloat(_ value: String) -> CGFloat {
		let result = NumberFormatter().number(from: value)
		if result != nil {
			return CGFloat(result!)
		} else {
			return 0
		}
	}

	func GetColor(_ value: String) -> UInt32 {
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

	func DrawScreen(_ view: UIViewController, currentTab: String = "") {
		while objects.count > 0 {
			var object = ScreenObject.Object()
			object = objects.first!
			DrawObject(view, object: object)
			objects.removeFirst()
		}
	}

	func DrawObject(_ view: UIViewController, object: Object) {
		switch object.type {
		case "background":
			AddBackground(view.view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, color: object.color)
		case "button":
			AddButton(view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, icon: object.icon, background: object.background, selector: object.selector)
		case "image":
			AddImage(view.view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, named: object.named)
		case "label":
			AddLabel(view.view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, text: object.text, font: object.font, size: object.size, color: object.color)
		case "check":
			AddCheckBox(view.view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, checked: object.status, checkedImage: object.checked, uncheckedImage: object.unchecked, selector: object.selector)
		default:
			break
		}
	}

	func AddBackground(_ view: UIView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, color: UInt32) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let background = UILabel()
		background.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		background.backgroundColor = constant.UIColorFromHex(color)
		view.addSubview(background)
	}

	func AddImage(_ view: UIView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, named: String) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let image = UIImage(named: named)
		let imageView = UIImageView(image: image!)
		imageView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		view.addSubview(imageView)
	}

	func AddLabel(_ view: UIView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, text: String, font: String, size: CGFloat, color: UInt32) {
		if text == "" {
			return
		}

		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let label = UILabel()
		label.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		label.text = text
		label.font = UIFont(name: font, size: size)
		label.textColor = constant.UIColorFromHex(color)
		view.addSubview(label)

	}

	func AddButton(_ view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, icon: String = "", background: String = "", title: String = "", titleColor: UIColor = UIColor.white, selector: Selector? = nil) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let button = UIButton()
		button.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		button.setImage(UIImage(named: icon), for: UIControlState())
		button.setBackgroundImage(UIImage(named: background), for: UIControlState())
		button.setTitle(title, for: UIControlState())

		button.setTitleColor(UIColor.black, for: UIControlState())

		if selector != nil {
			button.addTarget(view, action: selector!, for: UIControlEvents.touchUpInside)
		}
		view.view.addSubview(button)
	}

	func AddCheckBox(_ view: UIView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, checked: String = "", checkedImage: String = "", uncheckedImage: String = "", selector: Selector? = nil) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let checkBox = CheckBox()
		checkBox.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		checkBox.addTarget(view, action: selector!, for: UIControlEvents.touchUpInside)
		checkBox.SetCheckedImange(checkedImage)
		checkBox.SetUncheckedImange(uncheckedImage)
		view.addSubview(checkBox)

		let userDefaults = UserDefaults()
		let isChecked = userDefaults.GetBool(checked)
		checkBox.isChecked(isChecked)
	}

	func AddTableView(_ view: WorkoutsList, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let tableView = UITableView()
		tableView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		tableView.delegate = view
		tableView.dataSource = view
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.layoutMargins = UIEdgeInsets.zero
		tableView.separatorInset = UIEdgeInsets.zero
		//tableView.tableFooterView = UIView()
		tableView.rowHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: 339)

		view.view.addSubview(tableView)
	}

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        curElement = elementName
        didStartElement = true
        if elementName == "object" {
            object = Object()
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
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
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        didStartElement = false
        if elementName == "object" {
            objects.append(object)
        } else if elementName == "view" {
            isParsing = false
        }
    }
}

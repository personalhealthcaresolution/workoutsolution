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
		var check = ""
        var title = ""
        var alignX = ""
        var alignY = ""
		var status = ""
		var checked = ""
		var background = ""

		var size: CGFloat = 0
		var textX: CGFloat = 0
		var width: CGFloat = 0
		var height: CGFloat = 0
		var xPosition: CGFloat = 0
		var yPosition: CGFloat = 0
		var rowHeight: CGFloat = 0

		var color: UInt32 = 0
		var selector: Selector!
		var isChecked = false
        var backgroundColor: UInt32 = 0
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
			default: break
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
			default: break
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

	func CGFloatFromString(_ value: String) -> CGFloat {
		var isAdd = true
		var result: CGFloat = 0
		var valueArray = value.characters.split{$0 == " "}.map(String.init)
		while valueArray.count > 0 {
			let current = valueArray.first
			valueArray.removeFirst()
			switch current {
			case "+"?:
				isAdd = true
			case "-"?:
				isAdd = false
			case "screenWidth"?:
				result = result + ScreenSize.defaultWidth
			case "screenHeight"?:
				result = result + ScreenSize.defaultHeight
			default:
				let number = StringToCGFloat(current!)
				if isAdd {
					result = result + number
				} else {
					result = result - number
				}
			}
		}
		return result
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
            AddButton(view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, icon: object.icon, background: object.background, title: object.title, titleColor: object.color, selector: object.selector)
		case "image":
			AddImage(view.view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, named: object.named)
		case "label":
			AddLabel(view.view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, text: object.text, font: object.font, size: object.size, color: object.color)
        case "labelAuto":
            AddLabelAuto(view.view, alignX: object.alignX, alignY: object.alignY, text: object.text, font: object.font, size: object.size, color: object.color)
        case "textView":
            AddTextView(view.view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, text: object.text, font: object.font, size: object.size, color: object.color, backgroundColor: object.backgroundColor)
		case "check":
			AddCheckBox(view.view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, checked: object.status, checkImage: object.check, checkedImage: object.checked, selector: object.selector)
		case "levelButton":
			AddLevelButton(view.view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, title: object.text, textX: object.textX, background: object.color, icon: object.icon, selector: object.selector)
        case "backButton":
            AddBackButton(view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, title: object.text, background: object.color, icon: object.icon, selector: object.selector)
		case "footerButton":
			AddFooterButton(view, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, title: object.text, textX: object.textX, color: object.color, icon: object.icon, selector: object.selector)
		default:
			break
		}
	}

	func AddBackground(_ view: UIView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, color: UInt32, alpha:Double = 1.0) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let background = UILabel()
		background.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		background.backgroundColor = constant.UIColorFromHex(color, alpha: alpha)
		view.addSubview(background)
	}

	func AddImage(_ view: UIView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, named: String, useBundle: Bool = false) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		var image = UIImage()
		if useBundle {
			image = UIImage(named: named, in: Bundle(for: type(of: self)), compatibleWith: nil)!
		} else {
			image = UIImage(named: named)!
		}

		let imageView = UIImageView(image: image)
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

    func AddTextView(_ view: UIView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, text: String, font: String, size: CGFloat, color: UInt32, backgroundColor: UInt32) {
        if text == "" {
            return
        }
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)
        
        let textView = UITextView()
        textView.isEditable = false
        textView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
        textView.text = text
        textView.font = UIFont(name: font, size: size)
        textView.textColor = constant.UIColorFromHex(color)
        textView.backgroundColor = constant.UIColorFromHex(backgroundColor)
        view.addSubview(textView)
    }

	func AddTextBox(_ view: UIView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, font: String, size: CGFloat, color: UInt32) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let textBox = UITextView()
		textBox.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		textBox.font = UIFont(name: font, size: size)
		textBox.textColor = constant.UIColorFromHex(color)
		textBox.backgroundColor = constant.UIColorFromHex(0x373639)
		textBox.textAlignment = NSTextAlignment.center
		view.addSubview(textBox)
	}

	func AddButton(_ view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, icon: String = "", background: String = "", title: String = "", titleColor: UInt32 = Constant().white, selector: Selector? = nil) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let button = UIButton()
		button.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		button.setImage(UIImage(named: icon), for: UIControlState())
		button.setBackgroundImage(UIImage(named: background), for: UIControlState())
		button.setTitle(title, for: UIControlState())
        button.setTitleColor(constant.UIColorFromHex(titleColor), for: UIControlState())

		if selector != nil {
			button.addTarget(view, action: selector!, for: UIControlEvents.touchUpInside)
		}
		view.view.addSubview(button)
	}

    func AddBackButton(_ view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, title: String, background: UInt32, icon: String, selector: Selector? = nil) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)
        
        let button = BackButton()
        button.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
        if selector != nil {
            button.addTarget(view, action: selector!, for: UIControlEvents.touchUpInside)
        }
        view.view.addSubview(button)
    }

	func AddBackButton(_ button: BackButton, view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, title: String, icon: String, selector: Selector? = nil) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: 0)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		button.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		button.title.text = title
		button.addTarget(view, action: selector!, for: UIControlEvents.touchUpInside)
		view.view.addSubview(button)
	}

	func AddRoutineButton(_ button: RoutineButton, view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, selector: Selector? = nil) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		button.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		if selector != nil {
			button.addTarget(view, action: selector!, for: UIControlEvents.touchUpInside)
		}
		button.initView()
		view.view.addSubview(button)
	}

	func AddTypeButton(_ parent: UITableViewCell, target: UIViewController, object: Object) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: object.xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: object.yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: object.width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.height)

		let button = TypeButton()
		button.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		button.imageText = object.icon
		button.title.text = object.title
		let touched = NSSelectorFromString("Touched:")
		button.addTarget(button, action: touched, for: UIControlEvents.touchDown)
		button.addTarget(target, action: object.selector, for: UIControlEvents.touchUpInside)
		button.UpdateButton()
		parent.contentView.addSubview(button)
	}

	func AddLevelButton(_ view: UIView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, title: String, textX: CGFloat, background: UInt32, icon: String, parent: UIViewController? = nil, selector: Selector? = nil) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let button = LevelButton()
		button.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		button.imageText = icon
		button.title.text = title
		button.textX = textX
		button.backgroundColor = constant.UIColorFromHex(background)
		let touched = NSSelectorFromString("Touched:")
		button.addTarget(button, action: touched, for: UIControlEvents.touchDown)
		button.addTarget(parent, action: selector!, for: UIControlEvents.touchUpInside)
		button.UpdateButton()
		view.addSubview(button)
	}

	func AddFooterButton(_ view: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, title: String, textX: CGFloat, color: UInt32, icon: String, selector: Selector? = nil) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let button = FooterButton()
		button.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		button.imageText = icon
		button.title.text = title
		button.textX = textX
		button.title.textColor = constant.UIColorFromHex(color)
		if selector != nil {
			button.addTarget(view, action: selector!, for: UIControlEvents.touchUpInside)
		}
		button.UpdateButton()
		view.view.addSubview(button)
	}

	func AddCheckBox(_ view: UIView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, checked: String = "", checkImage: String = "", checkedImage: String = "", selector: Selector? = nil) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		let checkBox = CheckBox()
		checkBox.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		checkBox.SetCheckImange(checkImage)
		checkBox.SetCheckedImange(checkedImage)
		if (selector != nil) {
			checkBox.addTarget(view, action: selector!, for: UIControlEvents.touchUpInside)
		}
		view.addSubview(checkBox)

		let userDefaults = UserDefaults()
		let isChecked = userDefaults.GetBool(checked)
		checkBox.isChecked(isChecked)
	}

	func AddCheckBox(_ check: CheckBox, view: UIView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, checked: String = "", checkImage: String = "", checkedImage: String = "", parent: UITableViewCell? = nil, selector: Selector? = nil) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)
        
        check.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
        check.SetCheckImange(checkImage)
        check.SetCheckedImange(checkedImage)
        if (selector != nil) {
            check.addTarget(parent, action: selector!, for: UIControlEvents.touchUpInside)
        }
        view.addSubview(check)
    }

	func AddLabel(_ label: UILabel, view: UIView, object: Object, alpha: Double = 1.0) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: object.xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: object.yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: object.width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.height)

		label.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		label.text = object.text
		label.font = UIFont(name: object.font, size: object.size)
		label.textColor = constant.UIColorFromHex(object.color, alpha: alpha)
		view.addSubview(label)
	}

    func AddLabelAuto(_ view: UIView, alignX: String, alignY: String, text: String, font: String, size: CGFloat, color: UInt32) {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: font, size: size)
        label.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        label.textColor = constant.UIColorFromHex(color)
        label.sizeToFit()
        label.frame.origin.x = GetAutoX(alignX, width: label.frame.width)
        label.frame.origin.y = GetAutoY(alignY, height: label.frame.height)
        view.addSubview(label)
    }

    func AddLabelAuto(_ label: UILabel, view: UIView, alignX: String, alignY: String, text: String, font: String, size: CGFloat, color: UInt32) {
        label.text = text
        label.font = UIFont(name: font, size: size)
        label.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        label.textColor = constant.UIColorFromHex(color)
        label.sizeToFit()
        label.frame.origin.x = GetAutoX(alignX, width: label.frame.width)
        label.frame.origin.y = GetAutoY(alignY, height: label.frame.height)
        view.addSubview(label)
    }

    func AddButton(_ button: UIButton, view: UIView, viewController: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, icon: String = "", background: String = "", title: String = "", titleColor: UIColor = UIColor.white, selector: Selector? = nil) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)
        
        button.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
        button.setImage(UIImage(named: icon), for: UIControlState())
        button.setBackgroundImage(UIImage(named: background), for: UIControlState())
        button.setTitle(title, for: UIControlState())
        button.titleLabel?.font = UIFont(name: "Arial", size: 18)
        
        button.setTitleColor(titleColor, for: UIControlState())
        
        if selector != nil {
            button.addTarget(viewController, action: selector!, for: UIControlEvents.touchUpInside)
        }
        view.addSubview(button)
    }

    func AddMainButton(_ button: MainButton, viewController: UIViewController, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, icon: String = "", title: String = "", touched: Selector, clicked: Selector) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

		button.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		button.text = title
		button.iconNamed = icon
        button.addTarget(viewController, action: touched, for: UIControlEvents.touchDown)
        button.addTarget(viewController, action: clicked, for: UIControlEvents.touchUpInside)
		button.initView()
		viewController.view.addSubview(button)
	}

    func AddTextBox(_ textView: UITextField, view: UIView, background: UIImageView, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, content: String, font: String, size: CGFloat, color: UInt32) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)

        let image = UIImage(named: "backgroundTextbox")
        background.image = image
        background.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
        view.addSubview(background)
        
        textView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
        textView.font = UIFont(name: font, size: size)
        textView.text = content
        textView.textColor = constant.UIColorFromHex(color)
        textView.backgroundColor = constant.UIColorFromHex(0x373639, alpha: 0)
        textView.textAlignment = NSTextAlignment.center
        view.addSubview(textView)
    }
    
	func AddBackground(_ label: UILabel, view: UIView, object: Object, alpha:Double = 1.0) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: object.xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: object.yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: object.width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.height)
        
        label.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
        label.backgroundColor = constant.UIColorFromHex(object.color, alpha: alpha)
        view.addSubview(label)
    }

    func GetAutoX(_ value: String, width: CGFloat) -> CGFloat {
        if (value == "center") {
            return (ScreenSize.currentWidth - width) / 2
        } else {
            var isAdd = true
            var result: CGFloat = 0
            var valueArray = value.components(separatedBy: " ")
            while valueArray.count > 0 {
                let current = valueArray.first
                valueArray.removeFirst()
                switch current {
                case "-"?:
                    isAdd = false
                case "right"?:
                    result = ScreenSize.defaultWidth
                default:
                    let number = StringToCGFloat(current!)
                    if isAdd {
                        result = result + number
                    } else {
                        result = result - number - ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: width)
                    }
                }
            }
            return ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: result)
        }
    }

    func GetAutoY(_ value: String, height: CGFloat) -> CGFloat {
        if (value == "center") {
            return (ScreenSize.currentHeight - height) / 2
        } else {
            var isAdd = true
            var result: CGFloat = 0
            var valueArray = value.components(separatedBy: " ")
            while valueArray.count > 0 {
                let current = valueArray.first
                valueArray.removeFirst()
                switch current {
                case "-"?:
                    isAdd = false
                case "bottom"?:
                    result = ScreenSize.defaultHeight
                default:
                    let number = StringToCGFloat(current!)
                    if isAdd {
                        result = result + number
                    } else {
                        result = result - number - ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: height)
                    }
                }
            }
            return ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: result)
        }
    }

	func AddImage(_ image: UIImageView, view: UIView, object: Object) {
		let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: object.xPosition)
		let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: object.yPosition)
		let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: object.width)
		let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.height)

		let icon = UIImage(named: object.named)
		image.image = icon
		image.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
		view.addSubview(image)
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
			case "check":
				object.check = string
            case "title":
                object.title = string
            case "alignX":
                object.alignX = string
            case "alignY":
                object.alignY = string
			case "status":
				object.status = string
			case "checked":
				object.checked = string
			case "background":
				object.background = string

            case "size":
				object.size = StringToCGFloat(string)
			case "textX":
				object.textX = StringToCGFloat(string)
            case "width":
				object.width = CGFloatFromString(string)
            case "height":
                object.height = CGFloatFromString(string)
			case "posX":
				object.xPosition = CGFloatFromString(string)
			case "posY":
				object.yPosition = CGFloatFromString(string)
			case "rowHeight":
				object.rowHeight = CGFloatFromString(string)

			case "color":
				object.color = GetColor(string)
			case "selector":
				object.selector = GetSelector(string)
				if object.type == "check" {
					object.status = string
				}
            case "backgroundColor":
                object.backgroundColor = GetColor(string)
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

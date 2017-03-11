//
//  WorkoutParser.swift
//  WorkoutSolution
//
//  Created by ian on 3/8/17.
//  Copyright © 2017 Khai Dao. All rights reserved.
//

import UIKit

class WorkoutParser: NSObject, XMLParserDelegate {
	var isParsing: Bool = false
	var curElement: String = ""
	var didStartElement: Bool = false

	var workout = Workout()

	func Parse(_ value: Workout) -> Workout {
		workout = value
		let path = Bundle.main.path(forResource: workout.name, ofType: "xml")
		let data = try? Data.init(contentsOf: URL(fileURLWithPath: path!))
		let parser = XMLParser(data: data!)
		parser.delegate = self
		parser.parse()
		
		while isParsing {}
		return workout
	}

	//XMLParserDelegate
	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
		curElement = elementName
		didStartElement = true
	}
	
	func parser(_ parser: XMLParser, foundCharacters string: String) {
		if didStartElement {
			switch curElement {
			case "name":
				workout.name = string
			case "icon":
				workout.icon = string
			case "type":
				workout.type = string
			case "level":
				workout.level = string
			case "support":
				workout.support = string
			case "description":
				workout.description = string
			default: break
			}
		}
	}
	
	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
		didStartElement = false
		if elementName == "workout" {
			isParsing = false
		}
	}
}

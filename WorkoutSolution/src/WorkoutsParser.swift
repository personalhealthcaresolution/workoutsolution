//
//  WorkoutParser.swift
//  WorkoutSolution
//
//  Created by ian on 3/8/17.
//  Copyright © 2017 Khai Dao. All rights reserved.
//

import UIKit

class WorkoutsParser: NSObject, XMLParserDelegate {
	var isParsing: Bool = false
	var curElement: String = ""
	var didStartElement: Bool = false

	var workout = Workout()
	var workouts = [Workout]()

	func Parse() -> [Workout] {
		let path = Bundle.main.path(forResource: "ListWorkouts", ofType: "xml")
		let data = try? Data.init(contentsOf: URL(fileURLWithPath: path!))
		let parser = XMLParser(data: data!)
		parser.delegate = self
		parser.parse()

		while isParsing {}
		return workouts
	}

	//XMLParserDelegate
	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
		curElement = elementName
		didStartElement = true
		if elementName == "name" {
			workout = Workout()
		}
	}

	func parser(_ parser: XMLParser, foundCharacters string: String) {
		if didStartElement {
			if curElement == "name" {
				workout.name = string
			}
		}
	}
	
	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
		didStartElement = false
		if elementName == "name" {
			workouts.append(workout)
		} else if elementName == "workouts" {
			isParsing = false
		}
	}
}

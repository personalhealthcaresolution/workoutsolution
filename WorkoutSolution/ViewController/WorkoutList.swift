//
//  WorkoutList.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/18/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class WorkoutList: UIViewController {
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
    }

    func initView() {
        ScreenObject.addBackground(self, xPosition: 0, yPosition: 80, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: Color.citrus, screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addButton(self, xPosition: 70, yPosition: 83, width: 140, height: 140, icon: "back", screenWidth: screenWidth, screenHeight: screenHeight, selector: #selector(WorkoutList.btnBackClicked(_:)))

        ScreenObject.addBackground(self, xPosition: 0, yPosition: 220, width: ScreenSize.defaultWidth, height: 344, color: Color.coralRed, screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addButton(self, xPosition: 100, yPosition: 240, width: 304, height: 304, icon: "chinups", screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addLabel(self, xPosition: 440, yPosition: 310, width: 280, height: 164, text: "CHINUP", font: Font.helveticaNeueBold, size: 18, color: Color.citrus, screenWidth: screenWidth, screenHeight: screenHeight)

        ScreenObject.addBackground(self, xPosition: 0, yPosition: 595, width: ScreenSize.defaultWidth, height: 344, color: Color.coralRed, screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addButton(self, xPosition: 100, yPosition: 615, width: 304, height: 304, icon: "wallSix", screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addLabel(self, xPosition: 440, yPosition: 685, width: 350, height: 164, text: "WALL SIX", font: Font.helveticaNeueBold, size: 18, color: Color.citrus, screenWidth: screenWidth, screenHeight: screenHeight)

        ScreenObject.addBackground(self, xPosition: 0, yPosition: 970, width: ScreenSize.defaultWidth, height: 344, color: Color.coralRed, screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addButton(self, xPosition: 100, yPosition: 990, width: 304, height: 304, icon: "dipOnChair", screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addLabel(self, xPosition: 440, yPosition: 1060, width: 500, height: 164, text: "DIP ON CHAIR", font: Font.helveticaNeueBold, size: 18, color: Color.citrus, screenWidth: screenWidth, screenHeight: screenHeight)

        ScreenObject.addBackground(self, xPosition: 0, yPosition: 1345, width: ScreenSize.defaultWidth, height: 344, color: Color.coralRed, screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addButton(self, xPosition: 100, yPosition: 1365, width: 304, height: 304, icon: "squats", screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addLabel(self, xPosition: 440, yPosition: 1435, width: 280, height: 164, text: "SQUAT", font: Font.helveticaNeueBold, size: 18, color: Color.citrus, screenWidth: screenWidth, screenHeight: screenHeight)

        ScreenObject.addBackground(self, xPosition: 0, yPosition: 1720, width: ScreenSize.defaultWidth, height: 344, color: Color.coralRed, screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addButton(self, xPosition: 100, yPosition: 1740, width: 304, height: 304, icon: "pushUp", screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addLabel(self, xPosition: 440, yPosition: 1810, width: 320, height: 164, text: "PUSH UP", font: Font.helveticaNeueBold, size: 18, color: Color.citrus, screenWidth: screenWidth, screenHeight: screenHeight)

        ScreenObject.addButton(self, xPosition: 112, yPosition: 2076, width: 90, height: 90, icon: "exercises", screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addLabel(self, xPosition: 112, yPosition: 2166, width: 320, height: 30, text: "Exercises", font: Font.helveticaNeueBold, size: 5, color: Color.white, screenWidth: screenWidth, screenHeight: screenHeight)

        ScreenObject.addButton(self, xPosition: 412, yPosition: 2076, width: 90, height: 90, icon: "workouts", screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addLabel(self, xPosition: 412, yPosition: 2166, width: 320, height: 30, text: "Workouts", font: Font.helveticaNeueBold, size: 5, color: Color.white, screenWidth: screenWidth, screenHeight: screenHeight)

        ScreenObject.addButton(self, xPosition: 712, yPosition: 2076, width: 90, height: 90, icon: "tracker", screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addLabel(self, xPosition: 722, yPosition: 2166, width: 320, height: 30, text: "Tracker", font: Font.helveticaNeueBold, size: 5, color: Color.white, screenWidth: screenWidth, screenHeight: screenHeight)

        ScreenObject.addButton(self, xPosition: 1012, yPosition: 2076, width: 90, height: 90, icon: "setting", screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addLabel(self, xPosition: 1022, yPosition: 2166, width: 320, height: 30, text: "Settings", font: Font.helveticaNeueBold, size: 5, color: Color.white, screenWidth: screenWidth, screenHeight: screenHeight)
    }

    func btnBackClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showType", sender: self)
    }
}
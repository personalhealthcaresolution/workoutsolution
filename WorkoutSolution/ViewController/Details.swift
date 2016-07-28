//
//  Details.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/24/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Details: UIViewController {

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
        ScreenObject.addBackground(self, xPosition: 0, yPosition: 83, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: Color.citrus)
        ScreenObject.addButton(self, xPosition: 70, yPosition: 110, width: 50, height: 90, icon: "back", selector: #selector(Details.btnBackClicked(_:)))

        ScreenObject.addBackground(self, xPosition: 0, yPosition: 223, width: ScreenSize.defaultWidth, height: 709, color: Color.coralRed)

        ScreenObject.addImage(self, xPosition: 76, yPosition: 386, width: 385, height: 400, named: "before")
        ScreenObject.addLabel(self, xPosition: 93, yPosition: 829, width: 350, height: 57, text: "BEFORE", font: Font.helveticaNeueBold, size: 22, color: Color.citrus)

        ScreenObject.addImage(self, xPosition: 536, yPosition: 273, width: 630, height: 510, named: "behind")
        ScreenObject.addLabel(self, xPosition: 685, yPosition: 829, width: 332, height: 57, text: "BEHIND", font: Font.helveticaNeueBold, size: 22, color: Color.citrus)

        ScreenObject.addBackground(self, xPosition: 0, yPosition: 1813, width: ScreenSize.defaultWidth, height: 255, color: Color.coralRed)
        ScreenObject.addButton(self, xPosition: 260, yPosition: 1866, width: 722, height: 149, background: "button", title: "START ROUTINE")

        ScreenObject.addButton(self, xPosition: 112, yPosition: 2076, width: 90, height: 90, icon: "exercises")
        ScreenObject.addLabel(self, xPosition: 112, yPosition: 2166, width: 320, height: 30, text: "Exercises", font: Font.helveticaNeueBold, size: 5, color: Color.white)
        
        ScreenObject.addButton(self, xPosition: 412, yPosition: 2076, width: 90, height: 90, icon: "workouts")
        ScreenObject.addLabel(self, xPosition: 412, yPosition: 2166, width: 320, height: 30, text: "Workouts", font: Font.helveticaNeueBold, size: 5, color: Color.white)
        
        ScreenObject.addButton(self, xPosition: 712, yPosition: 2076, width: 90, height: 90, icon: "tracker")
        ScreenObject.addLabel(self, xPosition: 722, yPosition: 2166, width: 320, height: 30, text: "Tracker", font: Font.helveticaNeueBold, size: 5, color: Color.white)
        
        ScreenObject.addButton(self, xPosition: 1012, yPosition: 2076, width: 90, height: 90, icon: "setting")
        ScreenObject.addLabel(self, xPosition: 1022, yPosition: 2166, width: 320, height: 30, text: "Settings", font: Font.helveticaNeueBold, size: 5, color: Color.white)
    }

    func btnBackClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showWorkout", sender: self)
    }
}
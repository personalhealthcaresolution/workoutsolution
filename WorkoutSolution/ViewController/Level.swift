//
//  Level.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 6/8/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Level: UIViewController {

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
        ScreenObject.addBackground(self, xPosition: 0, yPosition: 80, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: Color.citrus)
        ScreenObject.addButton(self, xPosition: 70, yPosition: 83, width: 140, height: 140, icon: "back", selector: #selector(Level.btnBackClicked(_:)))

        //absBeginner
        ScreenObject.addBackground(self, xPosition: 0, yPosition: 203, width: 592, height: 592, color: Color.coralRed)
        ScreenObject.addLabel(self, xPosition: 41, yPosition: 273, width: 510, height: 100, text: "ABSOLUTE BEGINNER", font: Font.helveticaNeueBold, size: 12, color: Color.citrus)
        ScreenObject.addButton(self, xPosition: 121, yPosition: 375, width: 350, height: 350, icon: "absBeginner")

        //beginner
        ScreenObject.addBackground(self, xPosition: 650, yPosition: 203, width: 592, height: 592, color: Color.coralRed)
        ScreenObject.addLabel(self, xPosition: 821, yPosition: 273, width: 250, height: 100, text: "BEGINNER", font: Font.helveticaNeueBold, size: 12, color: Color.citrus)
        ScreenObject.addButton(self, xPosition: 771, yPosition: 375, width: 350, height: 350, icon: "beginner")

        //advanced
        ScreenObject.addBackground(self, xPosition: 0, yPosition: 853, width: 592, height: 592, color: Color.coralRed)
        ScreenObject.addLabel(self, xPosition: 166, yPosition: 923, width: 260, height: 100, text: "ADVANCED", font: Font.helveticaNeueBold, size: 12, color: Color.citrus)
        ScreenObject.addButton(self, xPosition: 121, yPosition: 1025, width: 350, height: 350, icon: "advanced")

        //intermediate
        ScreenObject.addBackground(self, xPosition: 650, yPosition: 853, width: 592, height: 592, color: Color.coralRed)
        ScreenObject.addLabel(self, xPosition: 771, yPosition: 923, width: 350, height: 100, text: "INTERMEDIATE", font: Font.helveticaNeueBold, size: 12, color: Color.citrus)
        ScreenObject.addButton(self, xPosition: 771, yPosition: 1025, width: 350, height: 350, icon: "intermediate")

        //cardio
        ScreenObject.addLabel(self, xPosition: (ScreenSize.defaultWidth - 280) / 2, yPosition: 1495, width: 280, height: 100, text: "CARDIO", font: Font.helveticaNeueBold, size: 18, color: Color.white)
        ScreenObject.addButton(self, xPosition: (ScreenSize.defaultWidth - 350) / 2, yPosition: 1645, width: 350, height: 350, icon: "cardio")
    }

    func btnBackClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showMain", sender: self)
    }
}
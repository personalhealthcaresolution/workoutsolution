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
        let constant = Constant()
        let screenObject = ScreenObject()

        screenObject.addBackground(self, xPosition: 0, yPosition: 83, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: constant.citrus)
        screenObject.addButton(self, xPosition: 70, yPosition: 110, width: 50, height: 90, icon: "back", selector: #selector(Level.btnBackClicked(_:)))

        //absBeginner
        screenObject.addBackground(self, xPosition: 0, yPosition: 224, width: 594, height: 650, color: constant.coralRed)
        screenObject.addLabel(self, xPosition: 20, yPosition: 294, width: 554, height: 40, text: "ABSOLUTE BEGINNER", font: constant.helveticaNeueBold, size: 13, color: constant.citrus)
        screenObject.addButton(self, xPosition: 91, yPosition: 392, width: 412, height: 412, icon: "absBeginner")

        //beginner
        screenObject.addBackground(self, xPosition: 652, yPosition: 224, width: 594, height: 650, color: constant.coralRed)
        screenObject.addLabel(self, xPosition: 816, yPosition: 294, width: 266, height: 40, text: "BEGINNER", font: constant.helveticaNeueBold, size: 13, color: constant.citrus)
        screenObject.addButton(self, xPosition: 743, yPosition: 392, width: 412, height: 412, icon: "beginner")

        //advanced
        screenObject.addBackground(self, xPosition: 0, yPosition: 932, width: 594, height: 650, color: constant.coralRed)
        screenObject.addLabel(self, xPosition: 156, yPosition: 1002, width: 282, height: 40, text: "ADVANCED", font: constant.helveticaNeueBold, size: 13, color: constant.citrus)
        screenObject.addButton(self, xPosition: 91, yPosition: 1100, width: 412, height: 412, icon: "advanced")

        //intermediate
        screenObject.addBackground(self, xPosition: 652, yPosition: 932, width: 594, height: 650, color: constant.coralRed)
        screenObject.addLabel(self, xPosition: 771, yPosition: 1002, width: 378, height: 40, text: "INTERMEDIATE", font: constant.helveticaNeueBold, size: 13, color: constant.citrus)
        screenObject.addButton(self, xPosition: 760, yPosition: 1100, width: 412, height: 412, icon: "intermediate")

        //cardio
        screenObject.addLabel(self, xPosition: (ScreenSize.defaultWidth - 340) / 2, yPosition: 1632, width: 340, height: 70, text: "CARDIO", font: constant.helveticaNeueBold, size: 22, color: constant.white)
        screenObject.addButton(self, xPosition: (ScreenSize.defaultWidth - 420) / 2, yPosition: 1738, width: 420, height: 420, icon: "cardio-1")
    }

    func btnBackClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showMain", sender: self)
    }
}
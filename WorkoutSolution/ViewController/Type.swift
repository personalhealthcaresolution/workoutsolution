//
//  Type.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 5/16/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Type: UIViewController {

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
        screenObject.addButton(self, xPosition: 70, yPosition: 110, width: 50, height: 90, icon: "back", selector: #selector(Type.btnBackClicked(_:)))

        screenObject.addBackground(self, xPosition: 0, yPosition: 223, width: ScreenSize.defaultWidth, height: 380, color: constant.coralRed)
        screenObject.addButton(self, xPosition: 104, yPosition: 262, width: 302, height: 302, icon: "upper", selector: #selector(Type.btnUpperClicked(_:)))
        screenObject.addLabel(self, xPosition: 536, yPosition: 389, width: 619, height: 48, text: "UPPER BODY", font: constant.helveticaNeueBold, size: 15, color: constant.citrus)

        screenObject.addBackground(self, xPosition: 0, yPosition: 638, width: ScreenSize.defaultWidth, height: 380, color: constant.coralRed)
        screenObject.addButton(self, xPosition: 104, yPosition: 677, width: 302, height: 302, icon: "lower", selector: #selector(Type.btnLowerClicked(_:)))
        screenObject.addLabel(self, xPosition: 536, yPosition: 804, width: 619, height: 48, text: "LOWER BODY", font: constant.helveticaNeueBold, size: 15, color: constant.citrus)

        screenObject.addBackground(self, xPosition: 0, yPosition: 1053, width: ScreenSize.defaultWidth, height: 380, color: constant.coralRed)
        screenObject.addButton(self, xPosition: 104, yPosition: 1092, width: 302, height: 302, icon: "coreAbs", selector: #selector(Type.btnCoreAbsClicked(_:)))
        screenObject.addLabel(self, xPosition: 536, yPosition: 1219, width: 619, height: 48, text: "CORE ABS", font: constant.helveticaNeueBold, size: 15, color: constant.citrus)

        screenObject.addLabel(self, xPosition: 104, yPosition: 1783, width: 391, height: 75, text: "CARDIO", font: constant.helveticaNeueBold, size: 25, color: constant.white)
        screenObject.addButton(self, xPosition: 592, yPosition: 1547, width: 547, height: 547, icon: "cardio")
    }

    func btnBackClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showMain", sender: self)
    }

    func btnUpperClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showWorkout", sender: self)
    }

    func btnLowerClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showWorkout", sender: self)
    }

    func btnCoreAbsClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showWorkout", sender: self)
    }
}
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
        ScreenObject.addBackground(self, xPosition: 0, yPosition: 80, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: Color.citrus)
        ScreenObject.addButton(self, xPosition: 70, yPosition: 83, width: 140, height: 140, icon: "back", selector: #selector(Type.btnBackClicked(_:)))

        ScreenObject.addBackground(self, xPosition: 0, yPosition: 223, width: ScreenSize.defaultWidth, height: 380, color: Color.coralRed)
        ScreenObject.addButton(self, xPosition: 104, yPosition: 262, width: 302, height: 302, icon: "upper", selector: #selector(Type.btnUpperClicked(_:)))
        ScreenObject.addLabel(self, xPosition: 536, yPosition: 389, width: 619, height: 48, text: "UPPER BODY", font: Font.helveticaNeueBold, size: 15, color: Color.citrus)

        ScreenObject.addBackground(self, xPosition: 0, yPosition: 638, width: ScreenSize.defaultWidth, height: 380, color: Color.coralRed)
        ScreenObject.addButton(self, xPosition: 104, yPosition: 677, width: 302, height: 302, icon: "lower", selector: #selector(Type.btnLowerClicked(_:)))
        ScreenObject.addLabel(self, xPosition: 536, yPosition: 804, width: 619, height: 48, text: "LOWER BODY", font: Font.helveticaNeueBold, size: 15, color: Color.citrus)

        ScreenObject.addBackground(self, xPosition: 0, yPosition: 1053, width: ScreenSize.defaultWidth, height: 380, color: Color.coralRed)
        ScreenObject.addButton(self, xPosition: 104, yPosition: 1092, width: 302, height: 302, icon: "coreAbs", selector: #selector(Type.btnCoreAbsClicked(_:)))
        ScreenObject.addLabel(self, xPosition: 536, yPosition: 1219, width: 619, height: 48, text: "CORE ABS", font: Font.helveticaNeueBold, size: 15, color: Color.citrus)

        ScreenObject.addLabel(self, xPosition: 104, yPosition: 1707, width: 619, height: 100, text: "CARDIO", font: Font.helveticaNeueBold, size: 20, color: Color.white)
        ScreenObject.addButton(self, xPosition: 723, yPosition: 1547, width: 419, height: 419, icon: "cardio")
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
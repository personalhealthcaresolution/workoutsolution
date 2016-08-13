//
//  Main.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 5/10/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Main: UIViewController {

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
        ScreenObject.addBackground(self, xPosition: 0, yPosition: 83, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: Constant.coralRed)
        ScreenObject.addBackground(self, xPosition: 0, yPosition: 80, width: ScreenSize.defaultWidth, height: 140, color: Constant.citrus)
        ScreenObject.addButton(self, xPosition: 70, yPosition: 110, width: 50, height: 90, icon: "back")

        ScreenObject.addImage(self, xPosition: 145, yPosition: 563, width: 952, height: 190, named: "calisthenics")

        ScreenObject.addLabel(self, xPosition: 351, yPosition: 1243, width: 540, height: 65, text: "CHOOSE BY", font: Constant.helveticaNeueBold, size: 22, color: Constant.citrus)

        ScreenObject.addButton(self, xPosition: 380, yPosition: 1388, width: 225, height: 225, icon: "type", selector: #selector(Main.btnTypeClicked(_:)))
        ScreenObject.addLabel(self, xPosition: 650, yPosition: 1475, width: 540, height: 52, text: "TYPE", font: Constant.helveticaNeueBold, size: 17, color: Constant.white)

        ScreenObject.addButton(self, xPosition: 380, yPosition: 1663, width: 225, height: 225, icon: "level", selector: #selector(Main.btnLevelClicked(_:)))
        ScreenObject.addLabel(self, xPosition: 650, yPosition: 1750, width: 540, height: 52, text: "LEVEL", font: Constant.helveticaNeueBold, size: 17, color: Constant.white)
    }

    func btnTypeClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showType", sender: self)
    }

    func btnLevelClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showLevel", sender: self)        
    }
}
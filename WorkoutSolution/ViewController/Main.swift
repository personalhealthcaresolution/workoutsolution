//
//  Main.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 5/10/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Main: UIViewController {
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
        //initView()
    }
    
    func initView() {
        ScreenObject.addBackground(self, xPosition: 0, yPosition: 80, width: ScreenSize.defaultWidth, height: ScreenSize.defaultHeight, color: Color.coralRed, screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addBackground(self, xPosition: 0, yPosition: 80, width: ScreenSize.defaultWidth, height: 140, color: Color.citrus, screenWidth: screenWidth, screenHeight: screenHeight)
        ScreenObject.addButton(self, xPosition: 70, yPosition: 83, width: 140, height: 140, icon: "back", screenWidth: screenWidth, screenHeight: screenHeight)

        ScreenObject.addImage(self, xPosition: 100, yPosition: 563, width: 1042, height: 150, named: "calisthenics", screenWidth: screenWidth, screenHeight: screenHeight)

        ScreenObject.addLabel(self, xPosition: 351, yPosition: 1103, width: 540, height: 100, text: "CHOOSE BY", font: Font.helveticaNeueBold, size: 23, color: Color.citrus, screenWidth: screenWidth, screenHeight: screenHeight)

        ScreenObject.addButton(self, xPosition: 380, yPosition: 1283, width: 300, height: 300, icon: "type", screenWidth: screenWidth, screenHeight: screenHeight, selector: #selector(Main.btnTypeClicked(_:)))
        ScreenObject.addLabel(self, xPosition: 730, yPosition: 1403, width: 540, height: 60, text: "TYPE", font: Font.helveticaNeueBold, size: 20, color: Color.white, screenWidth: screenWidth, screenHeight: screenHeight)

        ScreenObject.addButton(self, xPosition: 380, yPosition: 1613, width: 300, height: 300, icon: "level", screenWidth: screenWidth, screenHeight: screenHeight, selector: #selector(Main.btnLevelClicked(_:)))
        ScreenObject.addLabel(self, xPosition: 730, yPosition: 1733, width: 540, height: 60, text: "LEVEL", font: Font.helveticaNeueBold, size: 20, color: Color.white, screenWidth: screenWidth, screenHeight: screenHeight)
    }

    func btnTypeClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showType", sender: self)
    }

    func btnLevelClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showLevel", sender: self)        
    }
}
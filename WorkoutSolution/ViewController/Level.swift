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
        var objects = [ScreenObject.Object()]
        let screenObject = ScreenObject()
        objects = screenObject.getObjects("level")

        let i: Int = 0
        while  i < objects.count {
            var object = ScreenObject.Object()
            object = objects.first!
            switch object.type {
            case "background":
                screenObject.addBackground(self, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, color: object.color)
            case "button":
                screenObject.addButton(self, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, icon: object.icon, selector: getSelector(object.selector))
            case "image":
                screenObject.addImage(self, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, named: object.named)
            case "label":
                screenObject.addLabel(self, xPosition: object.xPosition, yPosition: object.yPosition, width: object.width, height: object.height, text: object.text, font: object.font, size: object.size, color: object.color)
            default:
                break
            }
            objects.removeFirst()
        }
    }

    func getSelector(value: String) -> Selector {
        switch value {
        case "btnBackClicked":
            return #selector(Level.btnBackClicked(_:))
        default:
            return nil
        }
    }

    func btnBackClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showMain", sender: self)
    }
}
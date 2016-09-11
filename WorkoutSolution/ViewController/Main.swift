//
//  Main.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 5/10/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Main: UIViewController, NSXMLParserDelegate {

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
        var objectsDraw = [ScreenObject.Object()]
        let screenObject = ScreenObject()
        objects = screenObject.GetObjects("Main")
        
        while objects.count > 0 {
            var object = ScreenObject.Object()
            object = objects.first!
            if object.selectorRaw != "" {
                object.selector = getSelector(object.selectorRaw)
            }
            objectsDraw.append(object)
            objects.removeFirst()
        }

        screenObject.objects = objectsDraw
        screenObject.DrawScreen(self)
    }

    func getSelector(value: String) -> Selector {
        switch value {
        case "btnTypeClicked":
            return #selector(Main.btnTypeClicked(_:))
        case "btnLevelClicked":
            return #selector(Main.btnLevelClicked(_:))
        default:
            return nil
        }
    }

    func btnTypeClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showType", sender: self)
    }

    func btnLevelClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showLevel", sender: self)        
    }
}
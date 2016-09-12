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
        var objectsDraw = [ScreenObject.Object()]
        let screenObject = ScreenObject()

		screenObject.ParseXML("Level")
		screenObject.ParseXML("Footer")
		objects = screenObject.GetObjects()
        
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
        case "btnBackClicked":
            return #selector(Level.btnBackClicked(_:))
		case "btnDetailsClicked":
			return #selector(Level.btnDetailsClicked(_:))
        default:
            return nil
        }
    }

	func btnBackClicked(sender:UIButton!) {
		self.performSegueWithIdentifier("showMain", sender: self)
	}

	func btnDetailsClicked(sender:UIButton!) {
		self.performSegueWithIdentifier("showDetails", sender: self)
	}
}
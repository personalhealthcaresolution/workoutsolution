//
//  WorkoutList.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 7/18/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class WorkoutList: UIViewController {
    var currenTab: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        ScreenSize.setStatusHeight(UIApplication.sharedApplication().statusBarFrame.size.height)
        ScreenSize.setCurrentWidth(self.view.frame.size.width)
        ScreenSize.setCurrentHeight(self.view.frame.size.height)

        currenTab = "exercises"
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
        objects = screenObject.GetObjects("workoutList")

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
        screenObject.DrawScreen(self, currentTab: currenTab)
    }

    func getSelector(value: String) -> Selector {
        switch value {
        case "btnBackClicked":
            return #selector(WorkoutList.btnBackClicked(_:))
        case "btnDetailsClicked":
            return #selector(WorkoutList.btnDetailsClicked(_:))
        case "btnExercisesClicked":
            return #selector(WorkoutList.btnExercisesClicked(_:))
        case "btnWorkoutsClicked":
            return #selector(WorkoutList.btnWorkoutsClicked(_:))
        case "btnTrackerClicked":
            return #selector(WorkoutList.btnTrackerClicked(_:))
        case "btnSettingClicked":
            return #selector(WorkoutList.btnSettingClicked(_:))
            
        default:
            return nil
        }
    }

    func btnDetailsClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showDetails", sender: self)
    }

    func btnBackClicked(sender:UIButton!) {
        self.performSegueWithIdentifier("showType", sender: self)
    }

    func btnExercisesClicked(sender:UIButton) {
        if currenTab != "exercises" {
            currenTab = "exercises"
            initView()
        }
    }

    func btnWorkoutsClicked(sender:UIButton) {
        if currenTab != "exercises" {
            currenTab = "workouts"
            initView()
        }
    }

    func btnTrackerClicked(sender:UIButton) {
        if currenTab != "exercises" {
            currenTab = "tracker"
            initView()
        }
    }

    func btnSettingClicked(sender:UIButton) {
        if currenTab != "exercises" {
            currenTab = "settings"
            initView()
        }
    }
}
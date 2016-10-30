//
//  Settings.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 10/4/15.
//  Copyright © 2015 Khai Dao. All rights reserved.
//

import UIKit

class Settings: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let screenObject = ScreenObject()
        screenObject.ParseXML("Settings")
        screenObject.ParseXML("Footer")
        
        var objects = screenObject.GetObjects()
        while objects.count > 0 {
            var object = ScreenObject.Object()
            object = objects.first!
            screenObject.DrawObject(self, object: object)
            objects.removeFirst()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func btnExercisesClicked(_ sender:UIButton) {
        switch Application.instance.currentExercisesView {
        case Application.ExercisesView.type:
            self.performSegue(withIdentifier: "showType", sender: self)
        case Application.ExercisesView.level:
            self.performSegue(withIdentifier: "showLevel", sender: self)
        case Application.ExercisesView.details:
            self.performSegue(withIdentifier: "showDetails", sender: self)
        case Application.ExercisesView.workouts:
            self.performSegue(withIdentifier: "showWorkouts", sender: self)
        }
    }

    func btnWorkoutsClicked(_ sender:UIButton) {
        switch Application.instance.CurrentWorkoutsView() {
        case Application.WorkoutsView.workouts:
            self.performSegue(withIdentifier: "showWorkoutsList", sender: self)
        case Application.WorkoutsView.exercises:
            self.performSegue(withIdentifier: "showExercises", sender: self)
        }
    }
    
    func btnTrackerClicked(_ sender:UIButton) {
    }
    
    func btnSettingsClicked(_ sender:UIButton) {
    }
}

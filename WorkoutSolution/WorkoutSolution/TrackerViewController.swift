//
//  TrackerViewController.swift
//  WorkoutSolution
//
//  Created by Khai Dao on 6/25/15.
//  Copyright (c) 2015 Khai Dao. All rights reserved.
//

import UIKit
import CoreMotion

class TrackerViewController: UIViewController {

    var counter: Int = 0
    var tracking: Bool = false
    var startAccelZ: Double = 0
    var currentAccelX: Double = 0
    var currentAccelY: Double = 0
    var currentAccelZ: Double = 0
    
    lazy var motionManager: CMMotionManager = {
        let motion = CMMotionManager()
        motion.accelerometerUpdateInterval = 1.0/10.0
        return motion
    }()

    @IBOutlet weak var enableTracker: UISwitch!
    @IBAction func trackerChangeValue(sender: UISwitch) {
        UIDevice.currentDevice().proximityMonitoringEnabled = enableTracker.on
        if enableTracker.on {
            let queue = NSOperationQueue()
            self.motionManager.startAccelerometerUpdatesToQueue(queue, withHandler:
                {data, error in
                    guard let data = data else {
                        return
                    }
                    if (UIDevice.currentDevice().proximityState) {
                        self.outputAccelerationData(data.acceleration)
                    }
                }
            )
        } else {
            self.motionManager.stopAccelerometerUpdates()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func outputAccelerationData(acceleration: CMAcceleration){
        //print("X = \(acceleration.x)")
        //print("Y = \(acceleration.y)")
        //print("Z = \(acceleration.z)")
        if (acceleration.z > startAccelZ && tracking) {
            counter++;
            tracking = false
            print("counter: \(counter)")
        } else {
            tracking = true
        }
    }

}

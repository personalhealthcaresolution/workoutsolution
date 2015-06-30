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
    
    var currentAccelX: Double = 0;
    var currentAccelY: Double = 0;
    var currentAccelZ: Double = 0;
    var currentMaxAccelZ: Double = 0;
    var counter: Int = 0;
    
    //let motionManager = CMMotionManager()

    @IBOutlet weak var enableTracker: UISwitch!
    @IBOutlet weak var accX: UILabel!
    @IBOutlet weak var accY: UILabel!
    @IBOutlet weak var accZ: UILabel!
    @IBOutlet weak var curProximity: UILabel!
    @IBOutlet weak var proximityState: UILabel!
    
    lazy var motionManager: CMMotionManager = {
        let motion = CMMotionManager()
        motion.accelerometerUpdateInterval = 1.0/10.0
        return motion
    }()

    @IBAction func trackerChangeValue(sender: UISwitch) {
        UIDevice.currentDevice().proximityMonitoringEnabled = enableTracker.on
        curProximity.text = UIDevice.currentDevice().proximityMonitoringEnabled.description
        if enableTracker.on {
            let queue = NSOperationQueue()
            self.motionManager.startAccelerometerUpdatesToQueue(queue, withHandler:
                {data, error in
                    guard let data = data else {
                        return
                    }
                    self.outputAccelerationData(data.acceleration)
                }
            )
        } else {
            self.motionManager.stopAccelerometerUpdates()
        }
        proximityState.text = UIDevice.currentDevice().proximityState.description
    }
    
    override func viewDidLoad() {
        curProximity.text = UIDevice.currentDevice().proximityMonitoringEnabled.description
        proximityState.text = "0"
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func outputAccelerationData(acceleration: CMAcceleration){
        //if (UIDevice.currentDevice().proximityState){
            self.accX.text = "\(acceleration.x)"
            self.accY.text = "\(acceleration.y)"
            self.accZ.text = "\(acceleration.z)"
            print("X = \(acceleration.x)")
            print("Y = \(acceleration.y)")
            print("Z = \(acceleration.z)")
            if (fabs(acceleration.z) > fabs(currentMaxAccelZ)){
                counter++;
                proximityState.text = counter.description
            }
        //}
    }
}

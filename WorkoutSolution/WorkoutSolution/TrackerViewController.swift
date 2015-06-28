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
    var currentMaxAccelX: Double = 0;
    
    var motionManager = CMMotionManager()

    @IBOutlet weak var enableTracker: UISwitch!
    @IBOutlet weak var accX: UILabel!
    @IBOutlet weak var accY: UILabel!
    @IBOutlet weak var accZ: UILabel!
    @IBOutlet weak var curProximity: UILabel!
    @IBOutlet weak var proximityState: UILabel!

    @IBAction func trackerChangeValue(sender: UISwitch) {
        UIDevice.currentDevice().proximityMonitoringEnabled = enableTracker.on
        curProximity.text = UIDevice.currentDevice().proximityMonitoringEnabled.description
        proximityState.text = UIDevice.currentDevice().proximityState.description
    }
    
    override func viewDidLoad() {
        
        curProximity.text = UIDevice.currentDevice().proximityMonitoringEnabled.description
        proximityState.text = UIDevice.currentDevice().proximityState.description
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue .currentQueue(), withHandler: {(accelerometerData: CMAccelerometerData!, error: NSError!) -> Void in
            self.outputAccelerationData(accelerometerData.acceleration)
            if (error != nil){
                println("\(error)")
            }
        })
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func outputAccelerationData(acceleration: CMAcceleration){
        if (UIDevice.currentDevice().proximityState){
            accX.text = "\(acceleration.x)"
            accY.text = "\(acceleration.y)"
            accZ.text = "\(acceleration.z)"
            if (fabs(acceleration.x) > fabs(currentMaxAccelX)){
                currentMaxAccelX = acceleration.x
            }
        }
    }
}

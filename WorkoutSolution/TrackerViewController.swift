//
//  TrackerViewController.swift
//  WorkoutSolution
//
//  Created by Khai Dao on 6/25/15.
//  Copyright (c) 2015 Khai Dao. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class TrackerViewController: UIViewController {

    var counter: Int = 0
    var tracking: Bool = false
    var startAccelY: Double = 0
    var currentAccelX: Double = 0
    var currentAccelY: Double = 0
    var currentAccelZ: Double = 0
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    lazy var motionManager: CMMotionManager = {
        let motion = CMMotionManager()
        motion.accelerometerUpdateInterval = 1.0/10.0
        return motion
    }()

    @IBOutlet weak var enableTracker: UISwitch!
    @IBAction func trackerChangeValue(sender: UISwitch) {
        UIDevice.currentDevice().proximityMonitoringEnabled = enableTracker.on
        if (enableTracker.on) {
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
            counter = 0
            startAccelY = 0
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
        if (startAccelY == 0) {
            startAccelY = acceleration.y
        }
        if (acceleration.y >= startAccelY) {
            if (tracking) {
                counter++;
                tracking = false
                textToSpeech(counter)
            }
        } else {
            tracking = true
        }
    }
    
    func textToSpeech(data: Int){
        let myString = String(data)
        myUtterance = AVSpeechUtterance(string: myString)
        synth.speakUtterance(myUtterance)
    }

}

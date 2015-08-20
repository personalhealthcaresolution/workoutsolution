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
import CoreLocation


class TrackerViewController: UIViewController {

    var curDate: NSDate!
    var counter: Int = 0
    var tracking: Bool = false
    var startValue: Double = 0
    var timer: NSTimer = NSTimer()
    var startTime = NSTimeInterval()
    var totalTime = NSTimeInterval()
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")

    @IBOutlet weak var enableTracker: UISwitch!
    
    lazy var motionManager: CMMotionManager = {
        let motion = CMMotionManager()
        motion.accelerometerUpdateInterval = 1.0/10.0
        return motion
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager.startDeviceMotionUpdates()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func trackerChangeValue(sender: UISwitch) {
        UIDevice.currentDevice().proximityMonitoringEnabled = enableTracker.on
        if (enableTracker.on) {
            startCounter()
        } else {
            stopCounter()
        }
    }
    
    func startCounter() {
        curDate = NSDate()
        let aSelector : Selector = "updateTime"
        startTime = NSDate.timeIntervalSinceReferenceDate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
    }
    
    func stopCounter() {
        counter = 0
        startValue = 0
        timer.invalidate()
        totalTime = NSDate.timeIntervalSinceReferenceDate() - startTime
        saveToSD()
    }
    
    func updateTime() {
        let deviceMotion: CMDeviceMotion! = motionManager.deviceMotion
        let acceleration: CMAcceleration! = deviceMotion.userAcceleration
        //print("\(deviceMotion)")
        
        if UIDevice.currentDevice().proximityState {
            if (startValue == 0) {
                startValue = acceleration.y
            }
            if (acceleration.y >= startValue) {
                if (tracking) {
                    counter++;
                    tracking = false
                    textToSpeech(counter)
                }
            } else {
                tracking = true
            }
        }
    }
    
    func textToSpeech(data: Int) {
        print("textToSpeech")
        let myString = String(data)
        myUtterance = AVSpeechUtterance(string: myString)
        synth.speakUtterance(myUtterance)
    }
    
    func saveToSD() {
        let documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let writePath = documents.stringByAppendingPathComponent("file.plist")

        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd:MM:yyyy-HH:mm:ss"
        let fileName = formatter.stringFromDate(curDate)+".txt"
        
        let text = totalTime.description + "|" + counter.description
        do {
            try text.writeToFile(writePath + fileName, atomically: true, encoding: NSUTF8StringEncoding)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        //reading
        /*
        var text2: String!
        do {
            text2 = try String(contentsOfFile: writePath + fileName, encoding: NSUTF8StringEncoding)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        print("text2: \(text2)")
        */
    }

}

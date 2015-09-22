//
//  Tracker.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 9/22/15.
//  Copyright © 2015 Khai Dao. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation
import CoreLocation

class Tracker: UIViewController {

    @IBOutlet weak var trackerSwitcher: UISwitch!
    @IBAction func trackerChangedValue(sender: UISwitch) {
        UIDevice.currentDevice().proximityMonitoringEnabled = trackerSwitcher.on
        if (trackerSwitcher.on) {
            startCounter()
        } else {
            stopCounter()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager.startDeviceMotionUpdates()
        trackerSwitcher.on = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var curDate: NSDate!
    var counter: Int = 0
    var tracking: Bool = false
    var startValue: Double = 0
    var timer: NSTimer = NSTimer()
    var startTime = NSTimeInterval()
    var totalTime = NSTimeInterval()
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    lazy var motionManager: CMMotionManager = {
        let motion = CMMotionManager()
        motion.accelerometerUpdateInterval = 1.0/10.0
        return motion
    }()

    func startCounter() {
        curDate = NSDate()
        let aSelector : Selector = "update"
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
    
    func saveToSD() {
        let documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let writePath = NSURL(fileURLWithPath: documents)
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd:MM:yyyy-HH:mm:ss"
        let fileName = formatter.stringFromDate(curDate)+".txt"
        
        let text = totalTime.description + "|" + counter.description
        print("documents: \(documents)")
        print("writePath: \(writePath)")
        print("fileName: \(fileName)")
        print("text: \(text)")
        
        do {
            try text.writeToFile(writePath.description + fileName, atomically: true, encoding: NSUTF8StringEncoding)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func textToSpeech(data: Int) {
        print("textToSpeech")
        let myString = String(data)
        myUtterance = AVSpeechUtterance(string: myString)
        synth.speakUtterance(myUtterance)
    }
    
    func update() {
        let deviceMotion: CMDeviceMotion! = motionManager.deviceMotion
        let acceleration: CMAcceleration! = deviceMotion.userAcceleration
        
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
}
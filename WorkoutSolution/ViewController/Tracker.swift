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
    @IBOutlet weak var open: UIBarButtonItem!
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    var xPosition: CGFloat = 0
    var yPosition: CGFloat = 0
    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0
    
    var trackerSwitcher = UISwitch();

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

    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager.startDeviceMotionUpdates()
        trackerSwitcher.addTarget(self, action: #selector(Tracker.switchValueDidChange(_:)), forControlEvents: .ValueChanged);
        
        open.target = self.revealViewController()
        open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        screenWidth = self.view.frame.size.width
        screenHeight = self.view.frame.size.height
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        let swap = screenWidth
        screenWidth = screenHeight
        screenHeight = swap
        initView()
    }
    
    func initView() {
        width = screenWidth
        height = screenHeight - 70
        xPosition = 150
        yPosition = 300

        trackerSwitcher.setOn(false, animated: false)
        trackerSwitcher.frame = CGRectMake(xPosition, yPosition, width, height)
        self.view.addSubview(trackerSwitcher)
    }

    func startCounter() {
        curDate = NSDate()
        let aSelector : Selector = #selector(Tracker.update)
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
        //print("documents: \(documents)")
        //print("writePath: \(writePath)")
        //print("fileName: \(fileName)")
        //print("text: \(text)")
        
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
        //let acceleration: CMAcceleration! = deviceMotion.userAcceleration

        if UIDevice.currentDevice().proximityState {
            if (startValue == 0) {
               startValue = deviceMotion.gravity.y
            }
            if (deviceMotion.gravity.y >= startValue) {
                if (tracking) {
                    counter += 1;
                    tracking = false
                    textToSpeech(counter)
                }
            } else {
                tracking = true
            }
        }
    }
    
    func switchValueDidChange(sender:UISwitch!) {
        if (sender.on == true) {
            startCounter()
        } else {
            stopCounter()
        }
    }
}
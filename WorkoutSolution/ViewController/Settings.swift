//
//  Settings.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 10/4/15.
//  Copyright © 2015 Khai Dao. All rights reserved.
//

import UIKit

class Settings: UIViewController {

    @IBOutlet weak var enableNotification: UISwitch!
    @IBAction func notificationChangedValue(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(enableNotification.on, forKey: "enableNotification")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        enableNotification.on = defaults.boolForKey("enableNotification")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

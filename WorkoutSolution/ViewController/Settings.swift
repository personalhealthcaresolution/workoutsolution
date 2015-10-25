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
        
        if (enableNotification.on) {
            
            let curDate = NSDate()
            let calendar = NSCalendar.currentCalendar()
            let componentsYear = calendar.components(NSCalendarUnit.Year, fromDate: curDate)
            let componentsMonth = calendar.components(NSCalendarUnit.Month, fromDate: curDate)
            let componentsDay = calendar.components(NSCalendarUnit.Day, fromDate: curDate)
            
            let dateComp:NSDateComponents = NSDateComponents()
            dateComp.year = componentsYear.year
            dateComp.month = componentsMonth.month;
            dateComp.day = componentsDay.day;
            dateComp.hour = 05;
            dateComp.minute = 30;
            dateComp.timeZone = NSTimeZone.systemTimeZone()
            
            let calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let date:NSDate = calender.dateFromComponents(dateComp)!
            
            let notification:UILocalNotification = UILocalNotification()
            notification.category = "notifications on"
            notification.alertBody = "Woww it works!!"
            notification.fireDate = date
            notification.repeatInterval = NSCalendarUnit.Day
                
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        enableNotification.on = defaults.boolForKey("enableNotification")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

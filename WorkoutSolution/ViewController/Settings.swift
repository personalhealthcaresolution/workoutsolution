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
    @IBAction func notificationChangedValue(_ sender: AnyObject) {
        let defaults = Foundation.UserDefaults.standard
        defaults.set(enableNotification.isOn, forKey: "enableNotification")
        
        if (enableNotification.isOn) {
            
            let curDate = Date()
            let calendar = Calendar.current
            let componentsYear = (calendar as NSCalendar).components(NSCalendar.Unit.year, from: curDate)
            let componentsMonth = (calendar as NSCalendar).components(NSCalendar.Unit.month, from: curDate)
            let componentsDay = (calendar as NSCalendar).components(NSCalendar.Unit.day, from: curDate)
            
            var dateComp:DateComponents = DateComponents()
            dateComp.year = componentsYear.year
            dateComp.month = componentsMonth.month;
            dateComp.day = componentsDay.day;
            dateComp.hour = 05;
            dateComp.minute = 30;
            (dateComp as NSDateComponents).timeZone = TimeZone.current
            
            let calender:Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
            let date:Date = calender.date(from: dateComp)!
            
            let notification:UILocalNotification = UILocalNotification()
            notification.category = "notifications on"
            notification.alertBody = "Woww it works!!"
            notification.fireDate = date
            notification.repeatInterval = NSCalendar.Unit.day
                
            UIApplication.shared.scheduleLocalNotification(notification)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = Foundation.UserDefaults.standard
        enableNotification.isOn = defaults.bool(forKey: "enableNotification")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

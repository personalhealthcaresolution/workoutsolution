//
//  ViewController.swift
//  WorkoutSolution
//
//  Created by Khai Dao on 6/10/15.
//  Copyright (c) 2015 Khai Dao. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
        
        let localNotification: UILocalNotification = UILocalNotification()
        localNotification.alertAction = "notifications on"
        localNotification.alertBody = "Woww it works!!"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 30)
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if ((FBSDKAccessToken.currentAccessToken()) != nil) {
            self.performSegueWithIdentifier("showApp", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil {
            print("login complete")
            self.performSegueWithIdentifier("showApp", sender: self)
        } else {
            print(error.localizedDescription)
        }
    }

    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("logged out")
    }

}


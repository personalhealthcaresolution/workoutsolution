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

    @IBOutlet weak var btnLogin: UIButton!
    @IBAction func showLogin(sender: AnyObject) {
        self.performSegueWithIdentifier("showLogin", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if ((FBSDKAccessToken.currentAccessToken()) != nil) {
            self.performSegueWithIdentifier("showApp", sender: self)
        }
        
        var username: String = ""
        var password: String = ""
        let defaults = NSUserDefaults.standardUserDefaults()
        if defaults.objectForKey("username") != nil {
            username = (defaults.objectForKey("username")?.description)!
        }
        if defaults.objectForKey("password") != nil {
            password = (defaults.objectForKey("password")?.description)!
        }
        
        let isUser: Bool = Account.verifyAccount(username, password: password)
        if isUser {
            self.performSegueWithIdentifier("showApp", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil {
            self.performSegueWithIdentifier("showApp", sender: self)
        } else {
            print(error.localizedDescription)
        }
    }

    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
    }

}


//
//  Login.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 11/25/15.
//  Copyright © 2015 Khai Dao. All rights reserved.
//

import UIKit

class Login: UIViewController {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var isUser: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func verifyAccount(sender: AnyObject) {
    }
    @IBAction func verifyAccount_(sender: AnyObject) {
        if txtUsername == "" {
            return
        } else if txtPassword == "" {
            return
        }

        let account = Account()
        isUser = account.verifyAccount(txtUsername.text!, password: txtPassword.text!)
        
        if isUser {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(txtUsername.text, forKey: "username")
            defaults.setObject(txtPassword.text, forKey: "password")

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewControllerWithIdentifier("InitialTracking") as UIViewController
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
}
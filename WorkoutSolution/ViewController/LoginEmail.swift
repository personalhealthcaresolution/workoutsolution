//
//  LoginEmail.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 2/20/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class LoginEmail: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    var isUser: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func verifyAccount(sender: AnyObject) {
        if txtUsername == "" {
            return
        } else if txtPassword == "" {
            return
        }
        
        isUser = Account.verifyAccount(txtUsername.text!, password: txtPassword.text!)
        
        if isUser {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(txtUsername.text, forKey: "username")
            defaults.setObject(txtPassword.text, forKey: "password")
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewControllerWithIdentifier("InitialApp") as UIViewController
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
}

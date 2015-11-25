//
//  Login.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 11/25/15.
//  Copyright © 2015 Khai Dao. All rights reserved.
//

import UIKit

class Login: UIViewController {

    var isUser: Bool = false

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
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
            self.performSegueWithIdentifier("showApp", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

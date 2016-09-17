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
    
    @IBAction func verifyAccount(_ sender: AnyObject) {
    }
    @IBAction func verifyAccount_(_ sender: AnyObject) {
        if txtUsername.text == "" {
            return
        } else if txtPassword.text == "" {
            return
        }

        let account = Account()
        isUser = account.verifyAccount(txtUsername.text!, password: txtPassword.text!)
        
        if isUser {
            let defaults = Foundation.UserDefaults.standard
            defaults.set(txtUsername.text, forKey: "username")
            defaults.set(txtPassword.text, forKey: "password")

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "InitialTracking") as UIViewController
            self.present(controller, animated: true, completion: nil)
        }
    }
}

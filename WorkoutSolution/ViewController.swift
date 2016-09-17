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
	public func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
	}

    @IBOutlet weak var btnLogin: UIButton!
    @IBAction func showLogin(_ sender: AnyObject) {
        //self.performSegueWithIdentifier("showLogin", sender: self)


        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "InitialController") as UIViewController
        self.present(controller, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if ((FBSDKAccessToken.current()) != nil) {
            self.performSegue(withIdentifier: "showApp", sender: self)
        }
        
        var username: String = ""
        var password: String = ""
        let defaults = Foundation.UserDefaults.standard
        if defaults.object(forKey: "username") != nil {
            username = ((defaults.object(forKey: "username") as AnyObject).description)!
        }
        if defaults.object(forKey: "password") != nil {
            password = ((defaults.object(forKey: "password") as AnyObject).description)!
        }

        let account = Account()
        let isUser: Bool = account.verifyAccount(username, password: password)
        if isUser {
            self.performSegue(withIdentifier: "showApp", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil {
            self.performSegue(withIdentifier: "showApp", sender: self)
        } else {
            print(error.localizedDescription)
        }
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
    }

}


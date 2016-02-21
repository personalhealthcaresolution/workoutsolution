//
//  LoginEmail.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 2/20/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class LoginEmail: UIViewController, UITextFieldDelegate {
    var btnLogin = UIButton()
    var txtUsername = UITextField()
    var txtPassword = UITextField()
    var btnResetPass = UIButton()

    var isUser = false
    var width: CGFloat = 0
    var height: CGFloat = 0
    var xPosition: CGFloat = 0
    var yPosition: CGFloat = 0
    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenWidth = self.view.frame.size.width
        screenHeight = self.view.frame.size.height
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        let swap = screenWidth
        screenWidth = screenHeight
        screenHeight = swap
        initView()
    }
    
    func initView() {
        height = 30
        width = screenWidth - 40
        xPosition = self.view.frame.origin.x + 20
        yPosition = self.view.frame.origin.y + 70
        txtUsername.frame = CGRectMake(xPosition, yPosition, width, height)

        txtUsername.placeholder = "Enter your username"
        txtUsername.borderStyle = UITextBorderStyle.RoundedRect
        txtUsername.delegate = self
        self.view.addSubview(txtUsername)
        
        height = 30
        width = screenWidth - 40
        xPosition = self.view.frame.origin.x + 20
        yPosition = txtUsername.frame.origin.y + txtUsername.frame.height + 10
        txtPassword.frame = CGRectMake(xPosition, yPosition, width, height)

        txtPassword.placeholder = "Enter your password"
        txtPassword.borderStyle = UITextBorderStyle.RoundedRect
        txtPassword.secureTextEntry = true
        txtPassword.delegate = self
        self.view.addSubview(txtPassword)
        
        width = 100
        height = 30
        xPosition = (screenWidth - width) / 2
        yPosition = txtPassword.frame.origin.y + txtPassword.frame.height + 10
        btnLogin.frame = CGRectMake(xPosition, yPosition, width, height)

        btnLogin.setTitle("Login", forState: UIControlState.Normal)
        btnLogin.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btnLogin.addTarget(self, action: "verifyAccount:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btnLogin)
        
        width = 150
        height = 30
        xPosition = (screenWidth - width) / 2
        yPosition = btnLogin.frame.origin.y + btnLogin.frame.height + 10
        btnResetPass.frame = CGRectMake(xPosition, yPosition, width, height)

        btnResetPass.setTitle("Forgot Password", forState: UIControlState.Normal)
        btnResetPass.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btnResetPass.addTarget(self, action: "resetPassword:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btnResetPass)
    }

    func verifyAccount(sender:UIButton!) {
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
    
    func resetPassword(sender:UIButton!) {
        print("Implementing")
    }
}

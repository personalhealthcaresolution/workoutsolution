//
//  SignUp.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 11/25/15.
//  Copyright © 2015 Khai Dao. All rights reserved.
//

import UIKit

class SignUp: UIViewController {
    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0

    var btnSignUp = UIButton()
    var txtUsername = UITextField()
    var txtPassword = UITextField()
    var txtPasswordAgain = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        screenWidth = self.view.frame.size.width
        screenHeight = self.view.frame.size.height
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        let swap = screenWidth
        screenWidth = screenHeight
        screenHeight = swap
        initView()
    }

    func addAccount(sender:UIButton!) {
        if (txtPassword.text == txtPasswordAgain.text) {
            Account.addAccount(txtUsername.text!, password: txtPassword.text!)
        }
    }

    func initView() {
        var width: CGFloat = 0
        var height: CGFloat = 0
        var xPosition: CGFloat = 0
        var yPosition: CGFloat = 0

        height = 30
        width = screenWidth - 40
        xPosition = self.view.frame.origin.x + 20
        yPosition = self.view.frame.origin.y + 70
        txtUsername.frame = CGRectMake(xPosition, yPosition, width, height)
        txtUsername.placeholder = "Enter your username"
        txtUsername.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(txtUsername)
        
        height = 30
        width = screenWidth - 40
        xPosition = self.view.frame.origin.x + 20
        yPosition = txtUsername.frame.origin.y + txtUsername.frame.height + 10
        txtPassword.frame = CGRectMake(xPosition, yPosition, width, height)
        txtPassword.placeholder = "Enter your password"
        txtPassword.borderStyle = UITextBorderStyle.RoundedRect
        txtPassword.secureTextEntry = true
        self.view.addSubview(txtPassword)

        height = 30
        width = screenWidth - 40
        xPosition = self.view.frame.origin.x + 20
        yPosition = txtPassword.frame.origin.y + txtUsername.frame.height + 10
        txtPasswordAgain.frame = CGRectMake(xPosition, yPosition, width, height)
        txtPasswordAgain.placeholder = "Enter your password again"
        txtPasswordAgain.borderStyle = UITextBorderStyle.RoundedRect
        txtPasswordAgain.secureTextEntry = true
        self.view.addSubview(txtPasswordAgain)

        width = 100
        height = 30
        xPosition = (screenWidth - width) / 2
        yPosition = txtPasswordAgain.frame.origin.y + txtPassword.frame.height + 10
        btnSignUp.frame = CGRectMake(xPosition, yPosition, width, height)
        
        btnSignUp.setTitle("SignUp", forState: UIControlState.Normal)
        btnSignUp.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btnSignUp.addTarget(self, action: #selector(SignUp.addAccount(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btnSignUp)
    }
}
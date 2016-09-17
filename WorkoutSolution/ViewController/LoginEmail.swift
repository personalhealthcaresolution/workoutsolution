//
//  LoginEmail.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 2/20/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class LoginEmail: UIViewController {
    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0

    var btnLogin = UIButton()
    var txtUsername = UITextField()
    var txtPassword = UITextField()
    var btnResetPass = UIButton()

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

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let swap = screenWidth
        screenWidth = screenHeight
        screenHeight = swap
        initView()
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
        txtUsername.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)

        txtUsername.placeholder = "Enter your username"
        txtUsername.borderStyle = UITextBorderStyle.roundedRect
        self.view.addSubview(txtUsername)
        
        height = 30
        width = screenWidth - 40
        xPosition = self.view.frame.origin.x + 20
        yPosition = txtUsername.frame.origin.y + txtUsername.frame.height + 10
        txtPassword.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)

        txtPassword.placeholder = "Enter your password"
        txtPassword.borderStyle = UITextBorderStyle.roundedRect
        txtPassword.isSecureTextEntry = true
        self.view.addSubview(txtPassword)
        
        width = 100
        height = 30
        xPosition = (screenWidth - width) / 2
        yPosition = txtPassword.frame.origin.y + txtPassword.frame.height + 10
        btnLogin.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)

        btnLogin.setTitle("Login", for: UIControlState())
        btnLogin.setTitleColor(UIColor.blue, for: UIControlState())
        btnLogin.addTarget(self, action: #selector(LoginEmail.verifyAccount(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnLogin)
        
        width = 150
        height = 30
        xPosition = (screenWidth - width) / 2
        yPosition = btnLogin.frame.origin.y + btnLogin.frame.height + 10
        btnResetPass.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)

        btnResetPass.setTitle("Forgot Password", for: UIControlState())
        btnResetPass.setTitleColor(UIColor.blue, for: UIControlState())
        btnResetPass.addTarget(self, action: #selector(LoginEmail.resetPassword(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnResetPass)
    }

    func verifyAccount(_ sender:UIButton!) {
        if txtUsername.text == "" {
            return
        } else if txtPassword.text == "" {
            return
        }

        let account = Account()
        let isUser = account.verifyAccount(txtUsername.text!, password: txtPassword.text!)
        
        if isUser {
            let defaults = Foundation.UserDefaults.standard
            defaults.set(txtUsername.text, forKey: "username")
            defaults.set(txtPassword.text, forKey: "password")
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "InitialApp") as UIViewController
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func resetPassword(_ sender:UIButton!) {
        print("Implementing")
    }
}

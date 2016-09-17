//
//  Main.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 5/10/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Main: UIViewController, XMLParserDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

		_ = Database()
        ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
        ScreenSize.setCurrentWidth(self.view.frame.size.width)
        ScreenSize.setCurrentHeight(self.view.frame.size.height)
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let swap = ScreenSize.getCurrentWidth()
        ScreenSize.setCurrentWidth(ScreenSize.getCurrentHeight())
        ScreenSize.setCurrentHeight(swap)
        //initView()
    }
    
    func initView() {
        let screenObject = ScreenObject()
        screenObject.ParseXML("Main")
        screenObject.DrawScreen(self)
    }

    func btnTypeClicked(_ sender:UIButton!) {
        self.performSegue(withIdentifier: "showType", sender: self)
    }

    func btnLevelClicked(_ sender:UIButton!) {
        self.performSegue(withIdentifier: "showLevel", sender: self)        
    }
}

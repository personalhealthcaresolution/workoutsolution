//
//  Main.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 5/10/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Main: UIViewController {
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
    }

    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        let swap = screenWidth
        screenWidth = screenHeight
        screenHeight = swap
        initView()
    }
    
    func initView() {
        self.view.backgroundColor = Color.UIColorFromHex(Color.coralRed)

        var width: CGFloat = 0
        var height: CGFloat = 0
        var xPosition: CGFloat = 0
        var yPosition: CGFloat = 0

        let image = UIImage(named: "calisthenics")
        let imageView = UIImageView(image: image!)

        height = 30
        width = screenWidth - 40
        xPosition = self.view.frame.origin.x + 20
        yPosition = self.view.frame.origin.y + 70
        imageView.frame = CGRectMake(xPosition, yPosition, width, height)
        view.addSubview(imageView)

        let btnType = UIButton()
        width = 100
        height = 100
        xPosition = (screenWidth - width) / 2
        yPosition = 150
        btnType.frame = CGRectMake(xPosition, yPosition, width, height)

        btnType.setImage(UIImage(named: "type"), forState: UIControlState.Normal)
        self.view.addSubview(btnType)

        let btnLevel = UIButton()
        width = 100
        height = 100
        xPosition = (screenWidth - width) / 2
        yPosition = 300
        btnLevel.frame = CGRectMake(xPosition, yPosition, width, height)
        
        btnLevel.setImage(UIImage(named: "level"), forState: UIControlState.Normal)
        self.view.addSubview(btnLevel)
    }
}

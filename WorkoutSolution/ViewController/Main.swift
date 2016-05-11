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

        width = screenWidth
        height = screenHeight / 16
        xPosition = 0
        yPosition = screenHeight / 24
        let labelBlack = UILabel()
        labelBlack.frame = CGRectMake(xPosition, yPosition, width, height)
        labelBlack.backgroundColor = Color.UIColorFromHex(Color.citrus)
        self.view.addSubview(labelBlack)

        width = screenHeight / 16
        height = screenHeight / 16
        xPosition = screenWidth / 18
        yPosition = screenHeight / 24
        let btnBack = UIButton()
        btnBack.frame = CGRectMake(xPosition, yPosition, width, height)
        btnBack.setImage(UIImage(named: "back"), forState: UIControlState.Normal)
        self.view.addSubview(btnBack)

        height = 36
        width = screenWidth - 40
        xPosition = 20
        yPosition = screenHeight / 5
        let image = UIImage(named: "calisthenics")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRectMake(xPosition, yPosition, width, height)
        view.addSubview(imageView)

        width = screenWidth - 80
        height = screenHeight / 16
        xPosition = 40
        yPosition = screenHeight / 2.4
        let labelChoose = UILabel()
        labelChoose.frame = CGRectMake(xPosition, yPosition, width, height)
        labelChoose.text = "CHOOSE BY"
        labelChoose.textColor = Color.UIColorFromHex(Color.citrus)
        self.view.addSubview(labelChoose)

        width = 100
        height = 100
        xPosition = screenWidth / 3
        yPosition = screenHeight / 2
        let btnType = UIButton()
        btnType.frame = CGRectMake(xPosition, yPosition, width, height)
        btnType.setImage(UIImage(named: "type"), forState: UIControlState.Normal)
        self.view.addSubview(btnType)

        width = screenWidth - 80
        height = screenHeight / 16
        xPosition = screenWidth / 1.5
        yPosition = screenHeight / 1.8
        let labelType = UILabel()
        labelType.frame = CGRectMake(xPosition, yPosition, width, height)
        labelType.text = "TYPE"
        labelType.font = UIFont(name: "Arial", size: 20)
        labelType.textColor = Color.UIColorFromHex(Color.white)
        self.view.addSubview(labelType)

        width = 100
        height = 100
        xPosition = screenWidth / 3
        yPosition = screenHeight / 1.45
        let btnLevel = UIButton()
        btnLevel.frame = CGRectMake(xPosition, yPosition, width, height)
        btnLevel.setImage(UIImage(named: "level"), forState: UIControlState.Normal)
        self.view.addSubview(btnLevel)

        width = screenWidth - 80
        height = screenHeight / 16
        xPosition = screenWidth / 1.5
        yPosition = screenHeight / 1.35
        let labelLevel = UILabel()
        labelLevel.frame = CGRectMake(xPosition, yPosition, width, height)
        labelLevel.text = "LEVEL"
        labelType.font = UIFont(name: "Arial", size: 20)
        labelLevel.textColor = Color.UIColorFromHex(Color.white)
        self.view.addSubview(labelLevel)
    }
}

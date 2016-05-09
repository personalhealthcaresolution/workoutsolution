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

        let imageName = "Calisthenics"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)

        height = 30
        width = screenWidth - 40
        xPosition = self.view.frame.origin.x + 20
        yPosition = self.view.frame.origin.y + 70
        imageView.frame = CGRectMake(xPosition, yPosition, width, height)
        view.addSubview(imageView)
    }
}

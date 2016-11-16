//
//  Main.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 5/10/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Main: UIViewController, XMLParserDelegate {
	let typeButton = MainButton()
	let levelButton = MainButton()

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

		screenObject.AddMainButton(typeButton, viewController: self, xPosition: 320, yPosition: 1170, width: 622, height: 264, icon: "type", title: "TYPE", selector: #selector(btnTypeClicked(_:)))
		screenObject.AddMainButton(levelButton, viewController: self, xPosition: 320, yPosition: 1484, width: 622, height: 264, icon: "level", title: "LEVEL", selector: #selector(btnLevelClicked(_:)))
	}

    func btnTypeClicked(_ sender:UIButton!) {
		typeButton.Touched()
        self.performSegue(withIdentifier: "showType", sender: self)
    }

    func btnLevelClicked(_ sender:UIButton!) {
		levelButton.Touched()
        self.performSegue(withIdentifier: "showLevel", sender: self)        
    }

	func PrintFontNames() {
		let fontFamilyNames = UIFont.familyNames
		for familyName in fontFamilyNames {
			print("------------------------------")
			print("Font Family Name = [\(familyName)]")
			let names = UIFont.fontNames(forFamilyName: familyName)
			print("Font Names = [\(names)]")
		}
	}
}

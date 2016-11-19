//
//  Type.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 5/16/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import UIKit

class Type: UIViewController, UITableViewDelegate, UITableViewDataSource {
	let backButton = BackButton()

    let constant = Constant()
    var tableView = UITableView()

    var workoutName = ["UPPER BODY", "LOWER BODY", "CORE ABS"]
    var workoutIcon = ["upper", "lower", "coreAbs"]
	var workoutSelector = ["btnUpperClicked", "btnLowerClicked", "btnCoreAbsClicked"]

    override func viewDidLoad() {
        super.viewDidLoad()

        ScreenSize.setStatusHeight(UIApplication.shared.statusBarFrame.size.height)
        ScreenSize.setCurrentWidth(self.view.frame.size.width)
        ScreenSize.setCurrentHeight(self.view.frame.size.height)

        Application.instance.CurrentTab(Application.Tabs.exercises)
		Application.instance.CurrentWorkout(Application.Workouts.type)
		Application.instance.CurrentExercisesView(Application.ExercisesView.type)

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
		screenObject.ParseXML("Type")
		screenObject.ParseXML("Footer")
        var objects = screenObject.GetObjects()
        while objects.count > 0 {
            var object = ScreenObject.Object()
            object = objects.first!
            
            if (object.type == "table") {
                AddTableView(object)
            } else {
                screenObject.DrawObject(self, object: object)
            }
            objects.removeFirst()
        }
		screenObject.AddBackButton(backButton, view: self, xPosition: 70, yPosition: 93, width: 400, height: 120, title: "Back", icon: "back", selector: #selector(btnBackClicked(_:)))
    }

    func AddTableView(_ object: ScreenObject.Object) {
        let positionX = ScreenSize.getPositionX(ScreenSize.getCurrentWidth(), positionX: object.xPosition)
        let positionY = ScreenSize.getPositionY(ScreenSize.getCurrentHeight(), positionY: object.yPosition)
        let itemWidth = ScreenSize.getItemWidth(ScreenSize.getCurrentWidth(), itemWidth: object.width)
        let itemHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.height)
        
        tableView.frame = CGRect(x: positionX, y: positionY, width: itemWidth, height: itemHeight)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TypeCell.self, forCellReuseIdentifier: "cell")
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorColor = constant.UIColorFromHex(constant.citrus)
        tableView.backgroundColor = constant.UIColorFromHex(object.color)
        
        tableView.rowHeight = ScreenSize.getItemHeight(ScreenSize.getCurrentHeight(), itemHeight: object.rowHeight)
        self.view.addSubview(tableView)
    }

    func btnBackClicked(_ sender:UIButton!) {
		backButton.Touched()
        self.performSegue(withIdentifier: "showMain", sender: self)
    }

    func btnUpperClicked(_ sender:UIButton!) {
		Application.instance.CurrentWorkoutType(Application.WorkoutsType.upper)
        self.performSegue(withIdentifier: "showWorkouts", sender: self)
    }

    func btnLowerClicked(_ sender:UIButton!) {
		Application.instance.CurrentWorkoutType(Application.WorkoutsType.lower)
        self.performSegue(withIdentifier: "showWorkouts", sender: self)
    }

    func btnCoreAbsClicked(_ sender:UIButton!) {
		Application.instance.CurrentWorkoutType(Application.WorkoutsType.coreAbs)
        self.performSegue(withIdentifier: "showWorkouts", sender: self)
    }

	func btnExercisesClicked(_ sender:UIButton) {
	}

	func btnWorkoutsClicked(_ sender:UIButton) {
		switch Application.instance.CurrentWorkoutsView() {
		case Application.WorkoutsView.workouts:
			self.performSegue(withIdentifier: "showWorkoutsList", sender: self)
		case Application.WorkoutsView.exercises:
			self.performSegue(withIdentifier: "showExercises", sender: self)
		}
	}

	func btnTrackerClicked(_ sender:UIButton) {
	}

    func btnSettingsClicked(_ sender:UIButton) {
        self.performSegue(withIdentifier: "showSettings", sender: self)
        
    }

    func btnTableViewCellClicked(_ rowIndex: Int) {
        switch workoutIcon[rowIndex] {
        case "upper":
            Application.instance.CurrentWorkoutType(Application.WorkoutsType.upper)
        case "lower":
            Application.instance.CurrentWorkoutType(Application.WorkoutsType.lower)
        case "coreAbs":
            Application.instance.CurrentWorkoutType(Application.WorkoutsType.coreAbs)
        default: break
        }
        self.performSegue(withIdentifier: "showWorkouts", sender: self)
    }

    //tableview delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        print(#function + " - indexPath: \(indexPath.row)")
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutName.count
    }
    
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
		return true
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TypeCell! = tableView.dequeueReusableCell(withIdentifier: "cell") as! TypeCell
		cell.titleText = workoutName[indexPath.row]
		cell.iconNamed = workoutIcon[indexPath.row]
		cell.selector = workoutSelector[indexPath.row]
		cell.parent = self
		cell.initView()
		return cell
	}

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print(#function + " - sourceIndexPath: \(sourceIndexPath)")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print(#function + " - indexPath: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        print(#function + " - indexPath: \(indexPath.row)")
    }
}

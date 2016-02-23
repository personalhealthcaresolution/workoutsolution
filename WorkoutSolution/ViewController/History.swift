//
//  History.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 11/6/15.
//  Copyright © 2015 Khai Dao. All rights reserved.
//

import UIKit
import Charts

class History: UIViewController {
    var width: CGFloat = 0
    var height: CGFloat = 0
    var xPosition: CGFloat = 0
    var yPosition: CGFloat = 0
    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0

    var months: [String]!
    var barChartView = BarChartView()

    override func viewDidLoad() {
        super.viewDidLoad()

        screenWidth = self.view.frame.size.width
        screenHeight = self.view.frame.size.height
        initView()

        months = [ "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" ]
        let unitsSold = [ 20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0 ]
        setChart(months, values: unitsSold)
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
        width = screenWidth
        height = screenHeight - 70
        xPosition = self.view.frame.origin.x
        yPosition = self.view.frame.origin.y + 20
        barChartView.frame = CGRectMake(xPosition, yPosition, width, height)
        self.view.addSubview(barChartView)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        barChartView.descriptionText = ""
        barChartView.noDataTextDescription = "GIVE REASON"
        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0 ..< dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
        barChartView.data = chartData
    }
    
    
}
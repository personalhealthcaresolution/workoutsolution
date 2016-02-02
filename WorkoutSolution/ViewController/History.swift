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
    @IBOutlet weak var barChartView: BarChartView!
    
    var months: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        months = [ "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" ]
        let unitsSold = [ 20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0 ]
        setChart(months, values: unitsSold)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
//
//  History.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 11/6/15.
//  Copyright © 2015 Khai Dao. All rights reserved.
//

import UIKit

class History: UIViewController, CPTPlotDataSource {
    
    @IBOutlet weak var graphView: CPTGraphHostingView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // create graph
        let graph = CPTXYGraph(frame: CGRectZero)
        graph.title = "Hello Graph"
        graph.paddingLeft = 0
        graph.paddingTop = 0
        graph.paddingRight = 0
        graph.paddingBottom = 0
        // hide the axes
        let axes = graph.axisSet as! CPTXYAxisSet
        let lineStyle = CPTMutableLineStyle()
        lineStyle.lineWidth = 0
        axes.xAxis!.axisLineStyle = lineStyle
        axes.yAxis!.axisLineStyle = lineStyle
        
        // add a pie plot
        let pie = CPTPieChart()
        pie.dataSource = self
        pie.pieRadius = (self.view.frame.size.width * 0.9)/2
        graph.addPlot(pie)
        
        self.graphView.hostedGraph = graph
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfRecordsForPlot(plot: CPTPlot) -> UInt {
        return 4
    }
    
    func numberForPlot(plot: CPTPlot, field fieldEnum: UInt, recordIndex idx: UInt) -> AnyObject? {
        return idx+1
    }
}

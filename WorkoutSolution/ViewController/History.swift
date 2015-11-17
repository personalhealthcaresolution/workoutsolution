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
    
    var datesInWeek :[NSNumber] = [10,35,18, 20, 50, 5]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // create graph
        /*
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
        */
        datesInWeek  = [10, 35, 18, 20, 50, 5]

        // 1 - Create the graph
        let graph = CPTXYGraph(frame: CGRectZero)
        graph.plotAreaFrame!.masksToBorder = false
        self.graphView.hostedGraph = graph
        // 2 - Configure the graph
        graph.applyTheme(CPTTheme(named:kCPTPlainBlackTheme))
        graph.paddingBottom = 30.0
        graph.paddingLeft  = 30.0
        graph.paddingTop    = -1.0
        graph.paddingRight  = -5.0
        // 3 - Set up styles
        let titleStyle = CPTMutableTextStyle()
        titleStyle.color = CPTColor.blackColor()
        titleStyle.fontName = "Helvetica-Bold"
        titleStyle.fontSize = 16.0
        // 4 - Set up title
        graph.title = "Portfolio Prices: April 23 - 27, 2012"
        graph.titleTextStyle = titleStyle
        graph.titlePlotAreaFrameAnchor = CPTRectAnchor.Top
        graph.titleDisplacement = CGPointMake(0.0, -16.0)
        // 5 - Set up plot space
        var xMin: Float = 0
        var xMax : Float = Float(datesInWeek.count) + 1
        var yMin : Float = 0
        var yMax : Float = 800
        var plotSpace = graph.defaultPlotSpace as! CPTXYPlotSpace
        var xRange = plotSpace.yRange.mutableCopy() as! CPTMutablePlotRange
        var yRange = plotSpace.yRange.mutableCopy() as! CPTMutablePlotRange
        
        // 1 - Set up the three plots
        let aaplPlot = CPTBarPlot()
        aaplPlot.barsAreHorizontal = false
        let googPlot = CPTBarPlot()
        googPlot.barsAreHorizontal = false
        let msftPlot = CPTBarPlot()
        msftPlot.barsAreHorizontal = false
        // 2 - Set up line style
        let barLineStyle = CPTMutableLineStyle()
        barLineStyle.lineColor = CPTColor.lightGrayColor()
        barLineStyle.lineWidth = 1
        // 3 - Add plots to graph
        aaplPlot.dataSource = self
        aaplPlot.delegate = self
        aaplPlot.barWidth = 1
        aaplPlot.barOffset = 1
        aaplPlot.lineStyle = barLineStyle
        
        googPlot.dataSource = self
        googPlot.delegate = self
        googPlot.barWidth = 1
        googPlot.barOffset = 1
        googPlot.lineStyle = barLineStyle
        
        msftPlot.dataSource = self
        msftPlot.delegate = self
        msftPlot.barWidth = 1
        msftPlot.barOffset = 1
        msftPlot.lineStyle = barLineStyle
        
        graph.addPlot(aaplPlot)
        graph.addPlot(googPlot)
        graph.addPlot(msftPlot)
        
        // 1 - Configure styles
        let axisTitleStyle = CPTMutableTextStyle()
        axisTitleStyle.color = CPTColor.redColor()
        axisTitleStyle.fontName = "Helvetica-Bold"
        axisTitleStyle.fontSize = 12.0
        let axisLineStyle = CPTMutableLineStyle()
        axisLineStyle.lineWidth = 4.0
        axisLineStyle.lineColor = CPTColor.redColor()
        // 2 - Get the graph's axis set
        let axisSet =  CPTXYAxisSet()
        graph.axisSet = axisSet
        // 3 - Configure the x-axis
        axisSet.xAxis!.labelingPolicy = CPTAxisLabelingPolicy.None
        axisSet.xAxis!.title = "Days of Week (Mon - Fri)"
        axisSet.xAxis!.titleTextStyle = axisTitleStyle
        axisSet.xAxis!.titleOffset = 10.0
        axisSet.xAxis!.axisLineStyle = axisLineStyle
        // 4 - Configure the y-axis
        axisSet.yAxis!.labelingPolicy = CPTAxisLabelingPolicy.None
        axisSet.yAxis!.title = "Price"
        axisSet.yAxis!.titleTextStyle = axisTitleStyle
        axisSet.yAxis!.titleOffset = 5.0
        axisSet.yAxis!.axisLineStyle = axisLineStyle
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

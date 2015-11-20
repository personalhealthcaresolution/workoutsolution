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
    
    var datesInWeek :[NSNumber] = [10, 35, 100, 20, 50, 5]

    override func viewDidLoad() {
        super.viewDidLoad()

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
        titleStyle.color = CPTColor.whiteColor()
        titleStyle.fontName = "Helvetica-Bold"
        titleStyle.fontSize = 16.0
        // 4 - Set up title
        graph.title = "Portfolio Prices: April 23 - 27, 2012"
        graph.titleTextStyle = titleStyle
        graph.titlePlotAreaFrameAnchor = CPTRectAnchor.Top
        graph.titleDisplacement = CGPointMake(0.0, -16.0)
        graph.plotAreaFrame?.paddingLeft = 30
        graph.plotAreaFrame?.paddingBottom = 30
        // 5 - Set up plot space
        let plotSpace = graph.defaultPlotSpace as! CPTXYPlotSpace
        plotSpace.allowsUserInteraction = true

        // 1 - Set up the three plots
        let aaplPlot = CPTScatterPlot()
        let aaplColor: CPTColor = CPTColor.redColor();
        // 2 - Set up line style
        let barLineStyle = CPTMutableLineStyle()
        barLineStyle.lineColor = CPTColor.lightGrayColor()
        barLineStyle.lineWidth = 1
        // 3 - Add plots to graph
        aaplPlot.dataSource = self
        aaplPlot.delegate = self
        graph.addPlot(aaplPlot, toPlotSpace: plotSpace)
        
        // 3 - Set up plot space
        let plots: [CPTPlot]? = [aaplPlot]
        plotSpace.scaleToFitPlots(plots)
        let xRange: CPTMutablePlotRange = plotSpace.xRange.mutableCopy() as! CPTMutablePlotRange
        plotSpace.xRange = xRange
        let yRange: CPTMutablePlotRange = plotSpace.yRange.mutableCopy() as! CPTMutablePlotRange
        plotSpace.yRange = yRange
        // 4 - Create styles and symbols
        let aaplLineStyle: CPTMutableLineStyle = (aaplPlot.dataLineStyle?.mutableCopy())! as! CPTMutableLineStyle
        aaplLineStyle.lineWidth = 2.5;
        aaplLineStyle.lineColor = aaplColor;
        aaplPlot.dataLineStyle = aaplLineStyle;

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
        return UInt(datesInWeek.count)
    }
    
    func numberForPlot(plot: CPTPlot, field fieldEnum: UInt, recordIndex idx: UInt) -> AnyObject? {
        switch (fieldEnum) {
        case 0:
            if (idx < UInt(datesInWeek.count)) {
                return idx + 1
            }
            break;
        case 1:
            return datesInWeek[Int(idx)]
        default:
            return 1
        }
        return 1
    }
}
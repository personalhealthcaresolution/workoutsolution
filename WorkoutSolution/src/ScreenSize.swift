//
//  ScreenSize.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 5/23/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import Foundation

class ScreenSize {
    internal static let defaultWidth: CGFloat = 1242
    internal static let defaultHeight: CGFloat = 2208

    static var statusHeight: CGFloat = 0
    static var currentWidth: CGFloat = 0
    static var currentHeight: CGFloat = 0

    class func getStatusHeight() -> CGFloat {
        return statusHeight
    }
    
    class func setStatusHeight(height: CGFloat) -> Void {
        statusHeight = height
    }

    class func getCurrentWidth() -> CGFloat {
        return currentWidth
    }

    class func setCurrentWidth(width: CGFloat) -> Void {
        currentWidth = width
    }

    class func getCurrentHeight() -> CGFloat {
        return currentHeight
    }

    class func setCurrentHeight(height: CGFloat) -> Void {
        currentHeight = height
    }

    class func getPositionX(screenWidth:CGFloat, positionX:CGFloat) ->  CGFloat {
        return (screenWidth * positionX) / defaultWidth
    }

    class func getPositionY(screenHeight:CGFloat, positionY:CGFloat) ->  CGFloat {
        return (screenHeight * positionY) / defaultHeight
    }

    class func getItemWidth(screenWidth:CGFloat, itemWidth:CGFloat) ->  CGFloat {
        return (screenWidth * itemWidth) / defaultWidth
    }
    
    class func getItemHeight(screenHeight:CGFloat, itemHeight:CGFloat) ->  CGFloat {
        return (screenHeight * itemHeight) / defaultHeight
    }
}
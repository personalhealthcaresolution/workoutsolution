//
//  Constant.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 8/13/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import Foundation

class Constant {
    internal static let helveticaNeueBold:String = "HelveticaNeue-Bold"

    internal static let white:UInt32 = 0xffffff
    internal static let citrus:UInt32 = 0x373639
    internal static let coralRed:UInt32 = 0xF94343
    
    class func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 256.0
        let blue = CGFloat(rgbValue & 0xFF) / 256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}
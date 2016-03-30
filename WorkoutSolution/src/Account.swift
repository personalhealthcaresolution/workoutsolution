//
//  Account.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 11/25/15.
//  Copyright © 2015 Khai Dao. All rights reserved.
//

import Foundation

class Account {
    
    class func verifyAccount(username: String, password: String) -> Bool {
        let request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000")!)
        request.HTTPMethod = "POST"
        let postString = "/ian/hello/world"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        task.resume()
        
        task.resume()
        return false
    }
}
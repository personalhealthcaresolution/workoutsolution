//
//  ConnectServer.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 4/14/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import Foundation

class ConnectServer {

    func sendRequest(postString: String, completion: (NSString) -> ()) {
        let url = NSURL(string: "http://localhost:3000")
        var responseString: NSString = ""
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        request.HTTPMethod = "POST"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)!
            completion(responseString)
        }
        task.resume()
    }
}
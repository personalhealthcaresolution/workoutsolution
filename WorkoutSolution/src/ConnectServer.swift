//
//  ConnectServer.swift
//  WorkoutSolution
//
//  Created by Thanh Long Nguyen on 4/14/16.
//  Copyright © 2016 Khai Dao. All rights reserved.
//

import Foundation

class ConnectServer {

    func sendRequest(_ postString: String, callback: @escaping (NSString) -> ()) {
        let url = URL(string: "http://localhost:3000")
        let request = NSMutableURLRequest(url: url!)
        request.httpBody = postString.data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
    }
}

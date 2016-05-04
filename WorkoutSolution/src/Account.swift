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
        var canResponse = false;
        var returnValue = false;

        let connect = ConnectServer()
        let postString = "action=signIn&username=\(username)&password=\(password)"

        connect.sendRequest(postString) { jsonString in
            if (jsonString == "true") {
                returnValue = true
            } else {
                returnValue = false
            }
            canResponse = true;
        }

        while (!canResponse) {}

        return returnValue
    }

    class func addAccount(username: String, password: String) -> Bool {
        let postString = "action=signUp&username=\(username)&password=\(password)"

        let connect = ConnectServer()
        connect.sendRequest(postString) { jsonString in
            print("ian test: \(jsonString)")
        }

        return false
    }
}
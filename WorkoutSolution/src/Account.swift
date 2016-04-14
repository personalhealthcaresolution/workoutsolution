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
        let postString = "action=signin&username=\(username)&password=\(password)"
        
        let connect = ConnectServer()
        connect.sendRequest(postString) { jsonString in
            print("ian test: \(jsonString)")
        }
        return false
    }

    class func addAccount(username: String, password: String) -> Bool {
        let postString = "action=signup&username=\(username)&password=\(password)"

        let connect = ConnectServer()
        connect.sendRequest(postString) { jsonString in
            print("ian test: \(jsonString)")
        }

        return false
    }
}
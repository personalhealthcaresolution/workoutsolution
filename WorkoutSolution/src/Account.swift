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
        var isUser: Bool = false
        if (username == "ianyuen") {
            if (password == "ian123") {
                isUser = true
            } else {
                isUser = false
            }
        }
        return isUser
    }
}
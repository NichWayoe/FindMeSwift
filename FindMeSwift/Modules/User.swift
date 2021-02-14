//
//  User.swift
//  FindMeSwift
//
//  Created by Nicholas Wayoe on 12/31/20.
//

import UIKit

class User {
    var username: String
    var email: String
    var firstName: String
    var lastName: String
    var password: String
    
    init(userDetails: [String: String]) {
        self.username = userDetails["username"]!
        self.email = userDetails["email"]!
        self.password = userDetails["password"]!
        self.firstName = userDetails["firstName"]!
        self.lastName = userDetails["lastName"]!
    }
    

}

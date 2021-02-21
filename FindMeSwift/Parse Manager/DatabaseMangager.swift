//
//  DatabaseMangager.swift
//  FindMeSwift
//
//  Created by Nicholas Wayoe on 12/31/20.
//

import Foundation
import Parse

class DatabaseManager {
    class func saveUser(user: User, completion: @escaping (Error?, Bool) -> Void)
    {
        let newUser = PFUser()
        newUser.email = user.email
        newUser["firstName"] = user.firstName
        newUser["lastName"] = user.lastName
        newUser.username = user.username
        newUser.password = user.password
        newUser.signUpInBackground { (succeeded:Bool, error: Error?) in
            if let error = error {
                    completion(error, false)
            }
            else {
                  completion(error,true)
            }
        }
    }
    
}

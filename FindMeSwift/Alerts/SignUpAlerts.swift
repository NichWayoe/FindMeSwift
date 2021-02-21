//
//  SignUpAlerts.swift
//  FindMeSwift
//
//  Created by Nicholas Wayoe on 2/20/21.
//

import UIKit

class SignUpAlerts: Alert {
    class func showSignUpFailureAlert(on vc: UIViewController, with title: String, error: Error? ) {
        SignUpAlerts.showAlert(on: vc, with: "Sign up Failed", message: error!.localizedDescription)
    }
    
}

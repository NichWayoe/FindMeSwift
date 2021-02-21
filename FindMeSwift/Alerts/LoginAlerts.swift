//
//  LoginAlerts.swift
//  FindMeSwift
//
//  Created by Nicholas Wayoe on 2/20/21.
//

import UIKit

class LoginAlerts:Alert {
    class func showloginFailureAlert(on vc: UIViewController, error: Error?)
    {
        LoginAlerts.showAlert(on: vc, with: "Login Failed", message: error!.localizedDescription)
    }
}



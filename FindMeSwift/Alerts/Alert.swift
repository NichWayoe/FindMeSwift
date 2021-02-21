//
//  Alert.swift
//  FindMeSwift
//
//  Created by Nicholas Wayoe on 2/20/21.
//

import UIKit

class Alert {
    static func showAlert(on vc:UIViewController, with title: String, message: String)
    {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            vc.present(alert, animated: true, completion: nil)}
    }
}

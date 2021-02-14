//
//  SignUpViewController.swift
//  FindMeSwift
//
//  Created by Nicholas Wayoe on 12/18/20.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setUpViewController()
        self.registerForKeyboardNotifications()
    }
    
    func setUpViewController()
    {
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        
        let contentWidth = self.scrollView.bounds.size.width
        let contentHeight = self.scrollView.bounds.size.height
        self.scrollView.contentSize.width = contentWidth
        self.scrollView.contentSize.height = contentHeight
        
        self.createBottomTextFields(textfield: usernameField)
        self.createBottomTextFields(textfield: lastNameField)
        self.createBottomTextFields(textfield: firstNameField)
        self.createBottomTextFields(textfield: passwordField)
        self.createBottomTextFields(textfield: emailField)
    }
    
    func registerForKeyboardNotifications()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(textfieldDidChange), name:UITextField.textDidChangeNotification, object: nil)
    }
    
    @objc func textfieldDidChange()
    {
        if (self.firstNameField.text?.count ?? 0 > 0 && self.lastNameField.text?.count ?? 0 > 0 && self.emailField.text?.count ?? 0 > 0  && self.passwordField.text?.count ?? 0 > 0 && self.usernameField.text?.count ?? 0 > 0) {
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        }
        else {
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    @IBAction func onTapNext(_ sender: Any)
    {
        //        let userDetails = [
        //            "username": self.usernameField.text!,
        //            "fistName": self.firstNameField.text!,
        //            "lastName": self.lastNameField.text!,
        //            "password": self.passwordField.text!,
        //        ]
        ////        let user = User(userDetails: userDetails)
    }
    
    func createBottomTextFields(textfield: UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
    }
    
    func showAlert(error: NSError)
    {
        
    }
}

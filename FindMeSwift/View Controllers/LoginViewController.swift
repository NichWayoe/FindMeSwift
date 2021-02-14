//
//  LoginViewController.swift
//  FindMeSwift
//
//  Created by Nicholas Wayoe on 10/17/20.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.logInButton.isEnabled = false
        self.registerForKeyboardNotifications()
    }
    
    @IBAction func onTapSignUp(_ sender: Any) {
        self.performSegue(withIdentifier:"signUpSegue", sender: nil)
    }
    @IBAction func dismissKeyboard(_ sender: Any)
    {
        self.view.endEditing(true)
    }
    
    func registerForKeyboardNotifications()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(aNotification: NSNotification)
    {
        let info = aNotification.userInfo!
        if let kbSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.2) {
                self.view.frame.origin.y = -kbSize.height/2
            }
        }
    }
    
    @objc func keyboardWillBeHidden(aNotification: NSNotification)
    {
        UIView.animate(withDuration: 0.2) {
            self.view.frame = CGRect(x: self.view.frame.origin.x, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        }
    }
    
    @IBAction func onLogin(_ sender: Any)
    {
        let username = self.usernameField.text!
        let password = self.passwordField.text!
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if let usernameTextCount = self.usernameField.text?.count, let passwordTextCount = self.passwordField.text?.count {
            if (usernameTextCount > 1 && passwordTextCount > 1) {
                self.logInButton.isEnabled = true
            }
            else {
                self.logInButton.isEnabled = false
            }
        }
        else {
            self.logInButton.isEnabled = false
        }
        return true
    }
    
    func showAlert(error: NSError)
    {
        let alert = UIAlertController.init(title: "Login Failed", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { (UIAlertAction) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

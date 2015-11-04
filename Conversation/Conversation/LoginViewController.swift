//
//  LoginViewController.swift
//  Login
//
//  Created by Paul Vagner on 10/15/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

import Parse

@IBDesignable

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func pressedLogin(sender: AnyObject) {
     
        
        guard let username = usernameField.text where !username.isEmpty else { return alertError("Login Failed", reason: "Please enter valid Username.") }
        
        guard let password = passwordField.text where !password.isEmpty else { return alertError("Login Failed", reason: "Please enter a valid Password.") }
        
            
            PFUser.logInWithUsernameInBackground(username, password: password) {
                
                (user: PFUser?, error: NSError?) -> Void in
                
                if user != nil {
                    // Do stuff after successful login.
                self.connectUserToDevice()
                    
                self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
                
                } else {
                    // The login failed. Check error to see why.
                    
                }
                
            }
            
        }
        
    
    
    @IBAction func pressedRegister(sender: AnyObject) {
        
        guard let username = usernameField.text where !username.isEmpty else { return alertError("Registration Failed", reason: "Please enter valid Username.") }
        
        guard let password = passwordField.text where !password.isEmpty else { return alertError("Registration Failed", reason: "Please enter a valid Password.") }

        guard let email = emailField.text where !email.isEmpty else { return alertError("Registration Failed", reason: "Please enter a valid E-Mail.") }
        
        
        let user = PFUser()
        
        user.username = username
        
        user.password = password
        
        user.email = email
        // other fields can be set just like with PFObject
        
        user.signUpInBackgroundWithBlock {
        
            (succeeded: Bool, error: NSError?) -> Void in
            
            if let error = error {
            
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
            
            } else {
                
                // Hooray! Let them use the app now.
            
            self.connectUserToDevice()
                
            self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
                
            
            }
            
            
        }
        
    }
    
    func connectUserToDevice() {
        
        let installation = PFInstallation.currentInstallation()
        
        installation["user"] = PFUser.currentUser()
        
        installation.saveInBackground()
        
    }
    
}

extension UIViewController {
    
    func alertError(title: String, reason: String) -> () {
        
        let alertVC = UIAlertController(title: title, message: reason, preferredStyle: .Alert)
        
        alertVC.addAction(UIAlertAction(title: "FINE", style: .Cancel, handler: { (action) -> Void in
            
            alertVC.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alertVC, animated: true, completion: nil)
        
    }
    
}




//
//  LoginViewController.swift
//  Carousel
//
//  Created by Jeremy Chipman on 10/17/15.
//  Copyright © 2015 Jeremy Chipman. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var signinButton: UIButton!
    
    @IBOutlet weak var signinView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let emptyFieldAlertController = UIAlertController(title: "Email required", message: "Please enter your email address", preferredStyle: .Alert)
    
    let badMatchAlertController = UIAlertController(title: "Sign in failed", message: "Incorrect email or password", preferredStyle: .Alert)
    
    let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
        
        // handle cancel response here. Doing nothing will dismiss the view.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add the cancel action to the alertController
        
        self.emptyFieldAlertController.addAction(self.cancelAction)
        self.badMatchAlertController.addAction(self.cancelAction)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        scrollView.contentOffset.y = 125
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        scrollView.contentOffset.y = -125
        
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPressSignIn (sender: AnyObject){
        if email.text!.isEmpty || password.text!.isEmpty {
            
            presentViewController(emptyFieldAlertController, animated: true) {
                
                // optional code for what happens after the alert controller has finished presenting
                // create a cancel action
                
            }
            // otherwise
        } else if email.text != "jc@me.com" || password.text != "pass"  {
            self.activityIndicator.startAnimating()
                // Delay for 2 seconds, then run the code between the braces.
                delay(2){
                    self.activityIndicator.stopAnimating()
                    self.presentViewController(self.badMatchAlertController, animated: true){
                        
                        // optional code for what happens after the alert controller has finished presenting
                        // create a cancel action
                        
                        
                        
                        // add the cancel action to the alertController
                    }
                }
            }else if self.email.text == "jc@me.com" && self.password.text == "pass" {
                self.activityIndicator.startAnimating()
                // Delay for 2 seconds, then run the code between the braces.
                
                delay(2) {
                    self.performSegueWithIdentifier("loginSegue", sender: nil)
                }
            }
        }
}


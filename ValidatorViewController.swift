//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    var emailvalid = false
    var confirmValid = false
    var phoneValid = false
    var passwordValid = false
    var passwordConfirm = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = false
        
          }
    
    @IBAction func TextFields(_ sender: UITextField) {
        
        if let placeHolder = sender.placeholder{
            if !checkValidation(placeHolder: placeHolder) {
                UIView.animate(withDuration: 1.0, animations: {
                    sender.textColor = UIColor.red
                    let animation = CABasicAnimation(keyPath: "position")
                    animation.duration = 0.07
                    animation.repeatCount = 3
                    animation.autoreverses = true
                    animation.fromValue = NSValue(cgPoint: CGPoint(x: sender.center.x - 10, y: sender.center.y))
                    
                    animation.toValue = NSValue(cgPoint: CGPoint(x: sender.center.x + 10, y: sender.center.y))
                    
                    sender.layer.add(animation, forKey: "position")
                    
                })
            }else{
                sender.textColor = UIColor.black
            }
        }
        if isAllTextFieldVaild() {
            sender.textColor = UIColor.black
            self.submitButton.isEnabled = true
        }
    }
    
    
    @IBAction func submitButton(_ sender: AnyObject) {
        
    }
    
    
    @IBAction func TextFiledChange(_ sender: UITextField) {
        if let placeHolder = sender.placeholder{
            if !checkValidation(placeHolder: placeHolder) {
                UIView.animate(withDuration: 1.0, animations: {
                    sender.textColor = UIColor.red
                    let animation = CABasicAnimation(keyPath: "position")
                    animation.duration = 0.07
                    animation.repeatCount = 3
                    animation.autoreverses = true
                    animation.fromValue = NSValue(cgPoint: CGPoint(x: sender.center.x - 10, y: sender.center.y))
                    
                    animation.toValue = NSValue(cgPoint: CGPoint(x: sender.center.x + 10, y: sender.center.y))
                    sender.layer.add(animation, forKey: "position")
                    
                })
            }else{
                sender.textColor = UIColor.black
            }
        }
        if isAllTextFieldVaild() {
            sender.textColor = UIColor.black
            self.submitButton.isEnabled = true
        }
    }
    
    func checkValidation(placeHolder: String) -> Bool {
        switch placeHolder {
        case "email":
            if let validtext = self.emailTextField.text {
                if validtext.contains("@") && validtext.contains(".") {
                    emailvalid = true
                    return true
                }
            }
        case "confirm email":
            if let validtext = self.emailConfirmationTextField.text {
                if validtext == self.emailTextField.text {
                    confirmValid = true
                    return true
                }
            }
        case "phone":
            if let validtext = self.phoneTextField.text {
                if validtext.characters.count >= 7 {
                    let badCharacters = NSCharacterSet.decimalDigits.inverted
                    
                    if validtext.rangeOfCharacter(from: badCharacters) == nil {
                        phoneValid = true
                        return true
                    }
                }
            }
        case "password":
            if let validtext = self.passwordTextField.text {
                if validtext.characters.count >= 6{
                    passwordValid = true
                    return true
                }
            }
        case "confirm password":
            if let validtext = self.passwordConfirmTextField.text {
                if validtext == self.passwordTextField.text {
                    passwordConfirm = true
                    return true
                }
            }
        default:
            print("invaild")
            
        }
        return false
    }
    
    func isAllTextFieldVaild() -> Bool {
        return self.emailvalid && self.confirmValid && self.phoneValid && self.passwordValid && self.passwordConfirm
    }
    
       
    
}

//
//  RegistrationViewController.swift
//  Pathy
//
//  Created by Abdullah Alatter on 14/01/2021.
//

import UIKit

class RegistrationViewController: UIViewController {

    
    
    
    private let usernameField: UITextField = {
        let feild = UITextField()
        feild.placeholder = "Username"
        feild.returnKeyType = .next
        feild.leftViewMode = .always
        feild.leftView = UIView(frame: CGRect(x:0,y:0,width:10,height:0) )
        feild.autocapitalizationType = .none
        feild.autocorrectionType =  .no
        feild.layer.masksToBounds = true
        feild.layer.cornerRadius = Constants.cornerRadius
        feild.backgroundColor = .secondarySystemBackground
        feild.layer.borderWidth = 1.0
        feild.layer.borderColor = UIColor.secondaryLabel.cgColor
        return feild
    }()

    
    private let emailField: UITextField = {
        let feild = UITextField()
        feild.placeholder = "Email"
        feild.returnKeyType = .next
        feild.leftViewMode = .always
        feild.leftView = UIView(frame: CGRect(x:0,y:0,width:10,height:0) )
        feild.autocapitalizationType = .none
        feild.autocorrectionType =  .no
        feild.layer.masksToBounds = true
        feild.layer.cornerRadius = Constants.cornerRadius
        feild.backgroundColor = .secondarySystemBackground
        feild.layer.borderWidth = 1.0
        feild.layer.borderColor = UIColor.secondaryLabel.cgColor
        return feild
    }()
    
    private let passwordField: UITextField = {
        let passwordField =  UITextField()
        passwordField.isSecureTextEntry = true
        passwordField.placeholder = "Password"
        passwordField.returnKeyType = .continue
        passwordField.leftViewMode = .always
        passwordField.leftView = UIView(frame: CGRect(x:0,y:0,width:10,height:0) )
        passwordField.autocapitalizationType = .none
        passwordField.autocorrectionType =  .no
        passwordField.layer.masksToBounds = true
        passwordField.layer.cornerRadius = Constants.cornerRadius
        passwordField.backgroundColor = .secondarySystemBackground
        passwordField.layer.borderWidth = 1.0
        passwordField.layer.borderColor = UIColor.secondaryLabel.cgColor
        return passwordField
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

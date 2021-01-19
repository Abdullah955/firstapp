//
//  RegistrationViewController.swift
//  Pathy
//
//  Created by Abdullah Alatter on 14/01/2021.
//

import UIKit

class RegistrationViewController: UIViewController {

    
    struct Constants {
        static let cornerRadius : CGFloat = 8.0
        
    }
    
    
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
        passwordField.placeholder = "Password n"
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
//        passwordField.textContentType = .oneTimeCode
        return passwordField
    }()
    

    private let RegisterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RegisterButton.addTarget(self,
                                 action: #selector(didTapRegister),
                                 for: .touchUpInside)
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
//        RegisterButton .delegate = self
        
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(RegisterButton)
        
        view.backgroundColor = .systemBackground
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 100, width: view.width - 40, height: 52)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom  + 10, width: view.width - 40, height: 52)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom + 10, width: view.width - 40, height: 52)
        RegisterButton.frame = CGRect(x: 20, y: passwordField.bottom  + 10, width: view.width - 40, height: 52)
        
        
        
    }

    @objc private func didTapRegister(){
        emailField.becomeFirstResponder()
        usernameField.becomeFirstResponder()
        passwordField.becomeFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 2,
              let username = usernameField.text, !username.isEmpty else {
            return
            
        }
        AuthManger.shared.regestirNewUser(username: username, email: email, password: password){ Registered in
            DispatchQueue.main.async {
                if Registered{
                    //Good to go :)
                    
                }
                else {
                    // Faild.
                }
            }
        }
        
    }
}


extension RegistrationViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textfild: UITextField) -> Bool{
        if textfild == usernameField{
            emailField.becomeFirstResponder()
        }
        else if textfild == emailField{
            passwordField.becomeFirstResponder()
        }
        else{
            
            didTapRegister()
        }
        return true
        
    }
    
    
}

//
//  LoginViewController.swift
//  Pathy
//
//  Created by Abdullah Alatter on 14/01/2021.
//

import UIKit

class LoginViewController: UIViewController {

    struct Constants {
        static let cornerRadius : CGFloat = 8.0
        
    }
    
    private let usernameField: UITextField = {
        let feild = UITextField()
        feild.placeholder = "Username or Email .."
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
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let CreateAccount: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create Account", for: .normal )
        return button
    }()
    
    
    
    private let headerView: UIView = {
        let header =  UIView()
        header.clipsToBounds = true
        header.backgroundColor = .red
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.addTarget(self , action: #selector(didTapLogin),for: .touchUpInside)
        CreateAccount.addTarget(self , action: #selector(didTapCreateAccount ),for: .touchUpInside)
        usernameField.delegate = self
        passwordField.delegate = self
        addSubViews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        // Assign .. later
        headerView.frame = CGRect(x:0
                                  ,y: 0.0
                                  ,width: view.width
                                  ,height: view.height/3.0)
        
        usernameField.frame = CGRect(x:25
                                  ,y: headerView.bottom + 40
                                  ,width: view.width-50
                                  ,height: 52.0)
        
        
        passwordField.frame = CGRect(x:25
                                  ,y: usernameField.bottom + 10
                                  ,width: view.width-50
                                  ,height: 52.0)
        
        
        loginButton.frame = CGRect(x:25
                                  ,y: passwordField.bottom + 10
                                  ,width: view.width-50
                                  ,height: 52.0)
        
        CreateAccount.frame = CGRect(x:25
                                  ,y: loginButton.bottom + 10
                                  ,width: view.width-50
     
                                     ,height: 52.0)
    }
    private func addSubViews(){
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(CreateAccount)
        view.addSubview(headerView)
    }

    
    
    
    @objc private func didTapLogin(){
        passwordField.resignFirstResponder()
        usernameField.resignFirstResponder()

        guard let usernameEmail = usernameField.text, !usernameEmail.isEmpty,
        let password = passwordField.text, !password.isEmpty, password.count >= 2 else{
            return
        }
        
        var username: String?
        var email: String?
        
        if usernameEmail.contains("@"), usernameEmail.contains("."){
            email = usernameEmail
        }
        else{
            username = usernameEmail
        }
        
        // login Functionality
        
        AuthManger.shared.loginUser(username: username,
                                    email: email,
                                    password: password){ sucess in
            DispatchQueue.main.async {
                if sucess {
                    self.dismiss(animated: true, completion: nil)
                }
                else{
                    let alert = UIAlertController(title: "Login Error",
                                                  message: "Username or Password not found",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title:"Dismiss",
                                                  style: .cancel,
                                                  handler: nil))
                    self.present(alert,animated: true)
                    }
            }
            
        }
        
    }
    
    
    
    
    @objc private func didTapCreateAccount(){
        let vc = RegistrationViewController()
        vc.title = "Create account"
        present(UINavigationController(rootViewController: vc), animated: true)
        
    }
    
    

}

extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameField{
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{
            didTapLogin()
        }
        return true
    }
}


 

//
//  LoginViewController.swift
//  Pathy
//
//  Created by Abdullah Alatter on 14/01/2021.
//

import UIKit

class LoginViewController: UIViewController {

    
    private let usernameField: UITextField = {
        return UITextField()
    }()
    
    private let passwordField: UITextField = {
        let passwordField =  UITextField()
        passwordField.isSecureTextEntry = true
        return passwordField
    }()
    
    private let loginButton: UIButton = {
        return UIButton()
    }()
    
    private let CreateAccount: UIButton = {
        return UIButton()
    }()
    
    
    
    private let headerView: UIView = {
        return UIView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        view.backgroundColor = .systemBackground

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Assign .. later
    }
    private func addSubViews(){
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(CreateAccount)
        view.addSubview(headerView)
    }

    @objc private func didTapLogin(){}
    @objc private func didTapCreateAccount(){}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

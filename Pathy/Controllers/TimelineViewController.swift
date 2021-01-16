//
//  ViewController.swift
//  Pathy
//
//  Created by Abdullah Alatter on 13/01/2021.
//

import UIKit
import FirebaseAuth




class TimelineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNonAuth()
        
    }

    
    private func handleNonAuth(){
            // check auth status
            if Auth.auth().currentUser != nil{
                // Show login
                let LoginVC = LoginViewController()
                LoginVC.modalPresentationStyle = .fullScreen
                present(LoginVC, animated: false)
            }
    }

    
}


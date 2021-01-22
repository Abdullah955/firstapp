//
//  ViewController.swift
//  Pathy
//
//  Created by Abdullah Alatter on 13/01/2021.
//

import UIKit
import FirebaseAuth


class TimelineViewController: UIViewController {

    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PostFeedTableViewCell.self, forCellReuseIdentifier: PostFeedTableViewCell.identifer )
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNonAuth()
        
    }

    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    private func handleNonAuth(){
            // check auth status
            if Auth.auth().currentUser == nil{
                // Show login
                let LoginVC = LoginViewController()
                LoginVC.modalPresentationStyle = .fullScreen
                present(LoginVC, animated: false)
            }
    }
    
    
    

    
}

extension TimelineViewController:  UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostFeedTableViewCell.identifer, for : indexPath) as! PostFeedTableViewCell
        
        return cell
    }
}

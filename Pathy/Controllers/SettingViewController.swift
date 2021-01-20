//
//  SettingViewController.swift
//  Pathy
//
//  Created by Abdullah Alatter on 20/01/2021.
//

import UIKit

class SettingViewController: UIViewController {

    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: "cell" )
        return tableView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension SettingViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}

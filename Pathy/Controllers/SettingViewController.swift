//
//  SettingViewController.swift
//  Pathy
//
//  Created by Abdullah Alatter on 20/01/2021.
//

import UIKit


struct SettingCellModel {
    let title: String
    let handler: (() -> Void)
}

// ViewController to show user Settings.
final class SettingViewController: UIViewController {

    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: "cell" )
        return tableView
        
    }()
    
    private var data = [[SettingCellModel]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurModels()
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

    
    
    private func configurModels(){
        let section = [
            SettingCellModel(title: "Log out") { [weak self] in
                self?.didTapLogOut()
                
            }
        ]
        data.append(section)
    }
    
    private func didTapLogOut(){
        
        let ActionSheet = UIAlertController(title: "Logout",
                                            message: "Are you sure you want to Logut ?",
                                            preferredStyle: .actionSheet)
        
        ActionSheet.addAction(UIAlertAction(title: "Cancle",
                                            style: .cancel,
                                            handler: nil)
                                            )
        
        AuthManger.shared.LogOut(completion: { sceess in
            if sceess{
                let LoginVC = LoginViewController()
                LoginVC.modalPresentationStyle = .fullScreen
                self.present(LoginVC, animated: true) {
                    self.navigationController?.popToRootViewController(animated: false)
                    self.tabBarController?.selectedIndex = 0 
                }

            }
            else {}
                
            
        } )
            
        }
        
    }


extension SettingViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Handle cell selection.
        let model = data[indexPath.section][indexPath.row]
        model.handler()
    }
}

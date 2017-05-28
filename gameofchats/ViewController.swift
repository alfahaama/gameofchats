//
//  ViewController.swift
//  gameofchats
//
//  Created by Mark Mansur on 2017-05-17.
//  Copyright © 2017 Mark Mansur. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
    }
    
    func handleLogout(){
        let loginController = LoginController()
        
        // once logout it hit, present the login controller
        present(loginController, animated: true, completion: nil)
    }
    



}


//
//  ViewController.swift
//  gameofchats
//
//  Created by Mark Mansur on 2017-05-17.
//  Copyright © 2017 Mark Mansur. All rights reserved.
//

import UIKit
import Firebase



class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        // user is not-signed in, logout the user
        if Auth.auth().currentUser == nil{
            
            // fixes too many controllers being presented error, by giving a slight delay (0 seconds) before calling logout... strange...
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }
    }
    
    func handleLogout(){
        
        do{
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        
        // once logout it hit, present the login controller
        present(loginController, animated: true, completion: nil)
        
    }
    



}


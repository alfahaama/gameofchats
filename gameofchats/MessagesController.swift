//
//  ViewController.swift
//  gameofchats
//
//  Created by Mark Mansur on 2017-05-17.
//  Copyright © 2017 Mark Mansur. All rights reserved.
//

import UIKit
import Firebase



class MessagesController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        let image = UIImage(named: "new_message_icon")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkIfUserIsLoggedIn()
    }
    
    func handleNewMessage() {
        let newMessageController = NewMessageController()
        present(newMessageController, animated: true, completion: nil)
    }
    
    func checkIfUserIsLoggedIn() {
        
        // user is not-signed in, logout the user
        if Auth.auth().currentUser == nil{
            
            // fixes too many controllers being presented error, by giving a slight delay (0 seconds) before calling logout... strange...
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else{
            let uid = Auth.auth().currentUser?.uid
            
            
            Database.database().reference().child("Users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                
                //dictionary of user name and email
                let dictionary = snapshot.value as? NSDictionary
                self.navigationItem.title = dictionary?["name"] as? String
    
                return
            })
            
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


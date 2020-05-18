//
//  LogOrRegViewController.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/13.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import UIKit



class LogOrRegViewController: UIViewController {

    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBackground()
    }
    
    func setBackground(){
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "backgroundp")
        view.sendSubviewToBack(backgroundImageView)
    }
    
    @IBAction func openLoginController(_ sender: Any) {
        /*
        self.present(openViewController(_storyboard:"Auth",idName: "loginpage", vc: LoginViewController()), animated: true, completion: nil)*/
        self.present(openViewController(_storyboard:"App",idName: "testpage2", vc: HomeViewController()), animated: true, completion: nil)
    }
    
    @IBAction func openSignUpController(_ sender: Any) {
        self.present(openViewController(_storyboard:"Auth",idName: "signuppage", vc: SignUpViewController()), animated: true, completion:nil)
    }
    
}

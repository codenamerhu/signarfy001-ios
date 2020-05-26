//
//  SignUpControllerView.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/14.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import UIKit
import KVNProgress
import SwiftValidator
import BSErrorMessageView
import PopupDialog
import CreditCardValidator
import CardScan
import Alamofire
import LMLoading

class SignUpViewController: UIViewController {
    
    var previousVC: UIViewController = LogOrRegViewController()
    
    @IBOutlet weak var full_name: CustomTextField!
    @IBOutlet weak var username: CustomTextField!
    @IBOutlet weak var password: CustomTextField!
    @IBOutlet weak var confirm_password: CustomTextField!
    
    let lView2 = UIView()
    let gif2 = UIImageView()
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        loadingV(is_loading: false)
        setupLoadingScreen()
        
        full_name.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        username.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        password.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        confirm_password.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        
    }
    @IBAction func back(_ sender: Any) {
        let toLogOrReg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginOrRegisterBoard2") as! LogOrRegViewController
        modalPresentationStyle = .fullScreen
        present(toLogOrReg, animated: true, completion: nil)
    }
    
    @IBAction func createAccount(_ sender: Any) {
        /*
        self.present(openViewController(_storyboard: "Auth", idName: "otppage", vc: OTPViewController()), animated: true, completion: nil) */
        
        if full_name.backgroundColor == .red {
            full_name.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        if username.backgroundColor == .red {
            username.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        if password.backgroundColor == .red {
            password.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        if confirm_password.backgroundColor == .red {
            confirm_password.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        guard full_name.text != "" else {
            
            print("Name text field should not be empty")
            full_name.backgroundColor = .red
            full_name.placeholder = "Full name | required"
            return
        }
        
        guard username.text != "" else {
            
            print("Email text field should not be empty")
            username.backgroundColor = .red
            username.placeholder = "Email | required"
            return
        }
        
        
        guard password.text != "" else {
            
            print("Password text field should not be empty")
            password.backgroundColor = .red
            password.placeholder = "Password | required"
            return
        }
        
        guard confirm_password.text != "" else {
            
            print("Confirm password text field should not be empty")
            confirm_password.backgroundColor = .red
            confirm_password.placeholder = "Confirm password | required"
            return
        }
        
        guard password.text == confirm_password.text else {
            print("passwords don't match")
            confirm_password.backgroundColor = .red
            confirm_password.text = ""
            confirm_password.placeholder = "Passwords do not match"
            return
        }
        
        loadingV(is_loading: true)
        
        let name = full_name.text!
        let user = username.text!
        let pass = password.text!
        
        let reqbody = ["full_name":name,"username":user,"password":pass]
        register(reqbody: reqbody)
    }
    
    func register(reqbody:[String:String]){
        
        SignarfyNetworkService.register(reqbody, resultCallback: {
        res in
        
        print("OOra")
        print(res! as Any)
        if let status:Dictionary<String,AnyObject> = res!{
            print(status)
            print("here")
            print(status["isSuccessful"]!)
            //LMLoading.hide()
            switch status["isSuccessful"] as! Int {
                case 1:
                    print("natha oora")
                
                    self.loadingV(is_loading: false)
                    // Open app home page
                self.present(openViewController(_storyboard:"Auth",idName: "otppage", vc: OTPViewController()), animated: true, completion: nil)
                
                case 0:
                    print("Nope")
                    self.loadingV(is_loading: false)
                showMessageDialog("Error", message: "Email or Password incorrect", image: nil, axis: .horizontal, viewController: self, handler: {
                    
                    // Clear password text field
                    //self.passwordTextField.text = ""
                    
                })
                    
                default:
                    print()
                }
            }
        
        }, errorCallback: { (err) in
            KVNProgress.dismiss()
            if (err.containsIgnoringCase(find: "serialize") || err.containsIgnoringCase(find: "JSON")){
                DispatchQueue.main.async {
                    self.loadingV(is_loading: false)
                    //self.delegate?.peachPay(self, didFailPaymentWithResult: ["error" : err as AnyObject])
                }
            }else{
                self.loadingV(is_loading: false)
                showMessageDialog("Error", message: err, image: nil, axis: .horizontal, viewController: self, handler: {
                    
                })
            }
            print(err)
        })
    }
    
    func setupLoadingScreen(){
        lView2.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
        gif2.loadGif(name: "Eclipse-1s-200px")
        
        view.addSubview(lView2)
        
        
        view.addSubview(gif2)
        
        gif2.translatesAutoresizingMaskIntoConstraints = false
        gif2.widthAnchor.constraint(equalToConstant: 150).isActive = true
        gif2.heightAnchor.constraint(equalToConstant: 150).isActive = true
        gif2.centerXAnchor.constraint(lessThanOrEqualTo: self.view.centerXAnchor).isActive = true
        gif2.centerYAnchor.constraint(lessThanOrEqualTo: self.view.centerYAnchor, constant: -60).isActive = true
        
        lView2.translatesAutoresizingMaskIntoConstraints = false
        
        lView2.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lView2.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        lView2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        lView2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func loadingV(is_loading:Bool){
        
        if is_loading == true {
            
            self.lView2.fadeIn()
            lView2.isHidden = false
            
            self.gif2.fadeIn()
            gif2.isHidden = false
            
        } else {
            
            self.lView2.fadeOut()
            lView2.isHidden = true
            
            self.gif2.fadeOut()
            gif2.isHidden = true
        }
        
    }
}

//
//  LoginController.swift
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

protocol SignargyControllerDelegate:class {
    func signarfyDidCancel(_ LoginViewControllerr:LoginViewController)
    func signarfy(_ LoginViewController:LoginViewController, didSucceedPaymentWithResult result:[String:AnyObject])
    func signarfy(_ LoginViewController:LoginViewController, didFailPaymentWithResult result:[String:AnyObject])
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var previousVC: UIViewController = LogOrRegViewController()
    
    
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    let lView2 = UIView()
    let gif2 = UIImageView()
    
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        loadingV(is_loading: false)
        setupViews()
    }
    
    @IBAction func back(_ sender: Any) {
        let toLogOrReg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginOrRegisterBoard2") as! LogOrRegViewController
        modalPresentationStyle = .fullScreen
        present(toLogOrReg, animated: true, completion: nil)
        
    }
    @IBAction func login_(_ sender: Any) {
        
        
        if emailTextField.backgroundColor == .red {
            emailTextField.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        if passwordTextField.backgroundColor == .red {
            passwordTextField.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        guard emailTextField.text != "" else {
            
            print("Email field show not be empty")
            emailTextField.backgroundColor = .red
            emailTextField.placeholder = "Email | required"
            return
        }
        
        guard passwordTextField.text != "" else {
            
            print("Password field show not be empty")
            passwordTextField.backgroundColor = .red
            passwordTextField.placeholder = "Password | required"
            return
        }
        
        loadingV(is_loading: true)
        
        let email       = emailTextField.text!
        let password    = passwordTextField.text!
        
        
        let reqbody = ["username":email,
                       "password":password]
        
        self.login(reqbody: reqbody)
    }
    @IBAction func goToRegister(_ sender: Any) {
        
    }
    
    
}


extension LoginViewController {
    
    func setupViews(){
        
        // Escape text fields
        emailTextField.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        passwordTextField.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        
        
        
        //lView2.alpha =
        
        setupLoadingScreen()
        
        //backgroundImageView.image = UIImage(named: "backgroundp")
        //view.sendSubviewToBack(backgroundImageView)
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
    
    func validateFields(){
        
        if emailTextField.backgroundColor == .red {
            emailTextField.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        if passwordTextField.backgroundColor == .red {
            passwordTextField.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        guard emailTextField.text != "" else {
            
            print("Email field show not be empty")
            emailTextField.backgroundColor = .red
            emailTextField.placeholder = "Email | required"
            return
        }
        
        guard passwordTextField.text != "" else {
            
            print("Password field show not be empty")
            passwordTextField.backgroundColor = .red
            passwordTextField.placeholder = "Password | required"
            return
        }
        
        return
    }
    
    func login(reqbody:[String:String]){
        
        SignarfyNetworkService.login(reqbody, resultCallback: {
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
                    
                    
                        // Open app home page
                        self.loadingV(is_loading: false)
                    self.present(openViewController(_storyboard:"App",idName: "testpage2", vc: HomeViewController()), animated: true, completion: nil)
                    
                    case 0:
                        self.loadingV(is_loading: false)
                        print("Nope")
                    showMessageDialog("Error", message: "Email or Password incorrect", image: nil, axis: .horizontal, viewController: self, handler: {
                        
                        // Clear password text field
                        self.passwordTextField.text = ""
                        
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

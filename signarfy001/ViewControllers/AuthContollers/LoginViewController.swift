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
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        //self.emailTextField.delegate = self


        emailTextField.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        passwordTextField.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        
    }
    @IBAction func back(_ sender: Any) {
        let toLogOrReg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginOrRegisterBoard2") as! LogOrRegViewController
        modalPresentationStyle = .fullScreen
        present(toLogOrReg, animated: true, completion: nil)
        
    }
    @IBAction func login_(_ sender: Any) {
        
        //LMLoading.show(loading: .image, target: view)
         
        let email       = emailTextField.text!
        
        let password    = passwordTextField.text!
        
        
        let reqbody = ["username":email,
                       "password":password]
        
        print(reqbody)
        
        self.login(reqbody: reqbody)
    }
    @IBAction func goToRegister(_ sender: Any) {
        
        
        
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
                    
                    case 0:
                        print("Nope")
                        
                    default:
                        print()
                    }
                }
            
            }, errorCallback: { (err) in
                KVNProgress.dismiss()
                if (err.containsIgnoringCase(find: "serialize") || err.containsIgnoringCase(find: "JSON")){
                    DispatchQueue.main.async {
                        //self.delegate?.peachPay(self, didFailPaymentWithResult: ["error" : err as AnyObject])
                    }
                }else{
                    showMessageDialog("Error", message: err, image: nil, axis: .horizontal, viewController: self, handler: {
                        
                    })
                }
                print(err)
            })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

//
//  Extension.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/15.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import UIKit
import PopupDialog
import CommonCrypto

func showMessageDialog (_ title:String, message:String , image:UIImage?,
    //axis:UILayoutConstraintAxis,viewController:UIViewController, handler:(() -> Void)?){
    axis:NSLayoutConstraint.Axis,viewController:UIViewController, handler:(() -> Void)?){
   //let popUp = PopupDialog(title: title, message: message, image: image, buttonAlignment: axis, transitionStyle: PopupDialogTransitionStyle.zoomIn, gestureDismissal: true, completion: handler)
    let popUp = PopupDialog(title: title, message: message, image:image, buttonAlignment: axis, transitionStyle: PopupDialogTransitionStyle.zoomIn, completion: handler)
    
    if let  _ = handler{
        let button =  DefaultButton(title: "OK"){
            handler!()
        }
        popUp.addButtons([button])
    }
    
    
    _ = viewController.present(popUp, animated: true)
}

extension String{
    func toCurrency(_ withFraction:Int = 0, locale:String = "ig_NG") -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = withFraction
        formatter.locale = Locale(identifier: locale)
        if self == ""{
            return formatter.string(from: NSNumber(value: 0))!
        }else{
            let val = (self as NSString).doubleValue
            return formatter.string(from: NSNumber(value: val))!
        }
    }
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
    func index(of target: String) -> Int? {
        if let range = self.range(of: target) {
            return distance(from: startIndex, to: range.lowerBound)
        } else {
            return nil
        }
    }
    
    func lastIndex(of target: String) -> Int? {
        if let range = self.range(of: target, options: .backwards) {
            return distance(from: startIndex, to: range.lowerBound)
        } else {
            return nil
        }
    }
}

func openViewController(_storyboard:String,idName:String , vc:UIViewController) -> UIViewController {
    
    
    
    var viewController:UIViewController = LogOrRegViewController()
    
    switch vc {
        
        case is LoginViewController:
            viewController = UIStoryboard(name:_storyboard, bundle: nil).instantiateViewController(withIdentifier: idName) as! LoginViewController
            
        case is SignUpViewController:
            viewController = UIStoryboard(name:_storyboard, bundle: nil).instantiateViewController(withIdentifier: idName) as! SignUpViewController
            
        case is OTPViewController:
            viewController = UIStoryboard(name:_storyboard, bundle: nil).instantiateViewController(withIdentifier: idName) as! OTPViewController
        
        case is HomeViewController:
            viewController = UIStoryboard(name:_storyboard, bundle: nil).instantiateViewController(withIdentifier: idName) as! HomeViewController
        
        case is HomeViewController:
        viewController = UIStoryboard(name:_storyboard, bundle: nil).instantiateViewController(withIdentifier: idName) as! HomeViewController
            
        default:
            print("some error")
    }
    
    return viewController
    
}

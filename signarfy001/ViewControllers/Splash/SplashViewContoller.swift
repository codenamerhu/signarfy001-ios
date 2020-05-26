//
//  SplashViewContoller.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/21.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import UIKit

class SplashViewController : UIViewController {
    
    var window: UIWindow?
    
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let is_looged_in = defaults.value(forKey: Keys.is_logged_in)
        print(is_looged_in!)
        if is_looged_in as! String == "1" {
            print("true")
            self.window?.rootViewController = UIStoryboard(name: "App", bundle: nil).instantiateInitialViewController()
        } else {
            print("false")
            /*
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                self.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            } */
            
        }
        
        */
    }
}

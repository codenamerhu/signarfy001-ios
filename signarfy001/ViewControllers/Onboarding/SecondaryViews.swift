//
//  SecondaryViews.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/13.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import UIKit

class SecondaryViews: UIViewController {

    var window: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func skip1(_ sender: Any) {
        goToLogOrReg()
    }
    @IBAction func skip2(_ sender: Any) {
        goToLogOrReg()
    }
    
    func goToLogOrReg(){
        //LogOrRegViewController.prev
        
        
        present(openViewController(_storyboard:"App",idName: "testpage2", vc: HomeViewController()), animated: true, completion: nil)
        /*
        let toLogOrReg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginOrRegisterBoard2") as! LogOrRegViewController
        modalPresentationStyle = .fullScreen
        present(toLogOrReg, animated: true, completion: nil)
        
        */
        
        
        
        /*
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = toLogOrReg
        self.window?.makeKeyAndVisible() */
        
        
        //self.navigationController?.pushViewController(toLogOrReg, animated: true)
        /*
        modalPresentationStyle = .fullScreen
        self.present(openViewController(_storyboard:"Main",idName: "LoginOrRegisterBoard2", vc: LogOrRegViewController()), animated: true, completion: nil) */
        
    }
}

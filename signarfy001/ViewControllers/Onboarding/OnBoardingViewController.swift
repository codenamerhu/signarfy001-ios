//
//  OnBoardingViewController.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/12.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import UIKit
import liquid_swipe

class ColoredController: UIViewController {
    
    
    var viewColor: UIColor = .white {
        didSet {
            viewIfLoaded?.backgroundColor = viewColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewColor
    }
}
class OnBoardingViewController: LiquidSwipeContainerController, LiquidSwipeContainerDataSource {
    
    let defaults = UserDefaults.standard
    var window: UIWindow?
    
    var viewControllers: [UIViewController] = {
        let firstPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "page1")
        let secondPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "page2")
        var controllers: [UIViewController] = [firstPageVC, secondPageVC]
        let vcColors: [UIColor] = []
            
            //[#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 1, green: 0.3529352546, blue: 0.2339158952, alpha: 1),#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1),#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)]
        
        controllers.append(contentsOf: vcColors.map {
            let vc = ColoredController()
            vc.viewColor = $0
            return vc
        })
        return controllers
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datasource = self
        
        Change()
        
    }

    func numberOfControllersInLiquidSwipeContainer(_ liquidSwipeContainer: LiquidSwipeContainerController) -> Int {
        return viewControllers.count
    }
    
    func liquidSwipeContainer(_ liquidSwipeContainer: LiquidSwipeContainerController, viewControllerAtIndex index: Int) -> UIViewController {
        return viewControllers[index]
    }
    
    
    func Change(){
        let is_looged_in = defaults.value(forKey: Keys.is_logged_in)
        print(is_looged_in!)
        print("\(String(describing: is_looged_in))")
        if is_looged_in == nil {
            
        } else if is_looged_in! as! Bool == true{
            print("in ")
            self.window?.rootViewController = UIStoryboard(name: "App", bundle: nil).instantiateInitialViewController()
            present(openViewController(_storyboard:"App",idName: "testpage2", vc: HomeViewController()), animated: true, completion: nil)
        }
    }
    
    

}



class Decider : UIViewController {
    
    let defaults = UserDefaults.standard
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        change()
        
    }
    
    func change(){
        let is_looged_in = defaults.value(forKey: Keys.is_logged_in)
        print(is_looged_in!)
        print("\(String(describing: is_looged_in))")
        if is_looged_in == nil {
            
        } else if is_looged_in! as! Bool == true{
            print("in ")
            let vc = UIStoryboard(name:"App", bundle: nil).instantiateViewController(withIdentifier: "testpage2") as! HomeViewController
            

            //UIApplication.shared.window.first.rootViewController = vc
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            
            window?.rootViewController = vc
        } else {
            present(openViewController(_storyboard:"Main",idName: "onB", vc: OnBoardingViewController()), animated: true, completion: nil)
        }
    }
}

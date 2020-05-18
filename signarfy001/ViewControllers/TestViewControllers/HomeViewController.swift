//
//  MenuTestViewController.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/15.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import UIKit

protocol ChangeDelegate: class {
    func changeColor(_ color: UIColor?)
}

class HomeViewController : UIViewController {
    @IBOutlet weak var mainTrailing: NSLayoutConstraint!
    @IBOutlet weak var mainLeading: NSLayoutConstraint!
    
    @IBOutlet weak var secondaryLeading: NSLayoutConstraint!
    @IBOutlet weak var secondaryTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var optionButton: UIButton!
    
    
    weak var delegate: ChangeDelegate?
    
    
    @IBOutlet weak var rightContainer: UIView!
    @IBOutlet weak var mainView: UIView!
    var mainViewPosition = 0
    
    var menu1Active = false
    var menu2Active = false
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        initializeSwipes()
        
        setupViews()
        
    }
    @IBAction func menu1(_ sender: Any) {
        
        menuChange1()
    }
    @IBAction func menu2(_ sender: Any) {
        
        menuChange2()
    }
}





extension HomeViewController {
    
    
    // Displays left menu in and out of view
    func menuChange1(){
        
        if mainViewPosition == 0 && menu1Active == false {
            mainLeading.constant    = 350
            mainTrailing.constant   = -350
            mainViewPosition        = 1
            menu1Active             = true
            
            
        } else
            
        if mainViewPosition == 1  && menu1Active == true{
            mainLeading.constant    = 0
            mainTrailing.constant   = 0
            mainViewPosition        = 0
            menu1Active             = false
            
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded() })
    }
    
    func menuChange2(){
        if mainViewPosition == 0 && menu2Active == false{
            mainLeading.constant    = -350
            mainTrailing.constant   = 350
            
            secondaryLeading.constant    = -350
            secondaryTrailing.constant   = 350
            mainViewPosition        = 2
            menu2Active             = true
            
        } else
            
        if mainViewPosition == 2 && menu2Active == true{
            mainLeading.constant    = 0
            mainTrailing.constant   = 0
            
            secondaryLeading.constant    = 0
            secondaryTrailing.constant   = 0
            
            mainViewPosition        = 0
            menu2Active             = false
            
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded() })
    }
    
    func initializeSwipes(){
        
        //mainView.addGestureRecognizer(.init(target: <#T##Any?#>, action: <#T##Selector?#>))
        
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))

        leftSwipe.direction = .left
        rightSwipe.direction = .right

        mainView.addGestureRecognizer(leftSwipe)
        //rightContainer.addGestureRecognizer(leftSwipe)
        mainView.addGestureRecognizer(rightSwipe)
    }
    
     @objc func handleSwipes(_ sender:UISwipeGestureRecognizer)
       {
           if (sender.direction == .left)
           {
            
            if mainViewPosition == 0 {
                menuChange2()
            } else if mainViewPosition == 2 {
                //menuChange2()
            } else if mainViewPosition == 1 {
                menuChange1()
            }
            
              

              // show the view from the right side
           }

           if (sender.direction == .right)
           {
            
            if mainViewPosition == 0 {
                menuChange1()
            } else if mainViewPosition == 1{
                
                /*
                let recents = MainMenuViewController()
                recents.rL = 300
                recents.rT = -355
                self.present(recents, animated: true)*/
                
                
                
                //menuChange1()
                prepareP()
            } else if mainViewPosition == 2 {
                menuChange2()
            }
            
        }
        // show the view from the left side
    }
    
    
    
    func setupViews(){
        optionButton.layer.cornerRadius = 20
    }
    
    override
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mainMenuSegue" {
            
            if let nav = segue.destination as? HomeViewController {
                nav.delegate = self as? ChangeDelegate
            }
            
            
        }
    }
    
    func prepareP() {
        
        
        delegate?.changeColor(.black)
    }
    
}

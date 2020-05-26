//
//  MainMenu.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/16.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import UIKit

class MainMenuViewController : UIViewController, ChangeDelegate {
    
    
    func changeColor(_ color: UIColor?) {
        print("hello")
        recentsView.backgroundColor = .black
    }
    
    
    @IBOutlet var primaryMenuView: UIView!
    
    @IBOutlet weak var recentsTrailing: NSLayoutConstraint!
    @IBOutlet weak var recentsLeading: NSLayoutConstraint!
    
    @IBOutlet weak var rightViewLeading: NSLayoutConstraint!
    @IBOutlet weak var rightViewtrailing: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var primaryButton: UIView!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet public weak var recentsView: UIView!
    @IBOutlet weak var topBar: UIView!
    
    var recentsViewPosition = 0
    @IBOutlet weak var threadsView: UIView!
    
    @IBOutlet weak var paginationImage: UIImageView!
    
    
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftView: UIView!
    
    
    var rL = 0
    var rT = 0
    var menu1Active = false
    var menu2Active = false
    
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        threadsView.layer.cornerRadius = 5
        threadsView.layer.masksToBounds = true
        
        searchButton.layer.cornerRadius = 5
        searchButton.layer.masksToBounds = true
        
        
        initializeSwipes()
        /*
        if recentsViewPosition == 0 {
            print("11")
            recentsViewPosition = recentsViewPosition + 1
        } else if recentsViewPosition == 1{
            
            print("12")
            recentsLeading.constant = -355
            recentsTrailing.constant = 355
        }*/
        
        
        
        
    }
    @IBAction func primaryMenuClicked(_ sender: Any) {change1()}
}

extension MainMenuViewController {
    
    /*
    override func childContaining(_ source: UIStoryboardUnwindSegueSource) -> UIViewController? {
        <#code#>
    } */
    
    func change1(){
        if recentsViewPosition == 0 && menu1Active == false {
            
            recentsLeading.constant = -415
            recentsTrailing.constant = 415
            
            recentsViewPosition = 1
            menu1Active = true
            
            paginationImage.image = UIImage(named: "page1-1")
            
             UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded() })
            
        } else if recentsViewPosition == 1 && menu1Active == true {
            
            recentsLeading.constant = 0
            recentsTrailing.constant = 59
            
            recentsViewPosition = 0
            menu1Active = false
            paginationImage.image = UIImage(named: "page2-1")
        }
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded() })
    }
    
    func change2(){
        if recentsViewPosition == 0 && menu2Active == false {
            
            recentsLeading.constant = 415
            recentsTrailing.constant = -415
            
            rightViewLeading.constant = 415
            rightViewtrailing.constant = -415
            
            recentsViewPosition = 2
            menu2Active = true
            
            paginationImage.image = UIImage(named: "page3")
            
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {self.recentsView.layoutIfNeeded() }, completion: { (value: Bool) in
                self.recentsView.isHidden = true
                self.rightView.isHidden = true
            })
            
            
            
         
        } else if recentsViewPosition == 2 && menu2Active == true {
            self.recentsView.isHidden = false
            
            if self.rightView.isHidden == true {
                self.rightView.isHidden = false
            }
            
            recentsLeading.constant = 0
            recentsTrailing.constant = 59
            
            rightViewLeading.constant = 0
            rightViewtrailing.constant = 59
            
            recentsViewPosition = 0
            menu2Active = false
            
            paginationImage.image = UIImage(named: "page2-1")
        }
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded() })
    }
    
    func initializeSwipes(){
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))

        leftSwipe.direction = .left
        rightSwipe.direction = .right

        primaryMenuView.addGestureRecognizer(leftSwipe)
        //rightContainer.addGestureRecognizer(leftSwipe)
        primaryMenuView.addGestureRecognizer(rightSwipe)
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
              if (sender.direction == .left) {
                 // show the view from the right side
                if recentsViewPosition == 0 {
                    
                    change1()
                    
                } else if recentsViewPosition == 2 {
                    
                    change2()
                }
              }

              if (sender.direction == .right) {
                
                if recentsViewPosition == 0 {
                    change2()
                } else if recentsViewPosition == 1 {
                    change1()
                }
                
               
           }
           // show the view from the left side
       }
}



extension UIView {

    func fadeIn(_ duration: TimeInterval? = 0.2, onCompletion: (() -> Void)? = nil) {
        self.alpha = 0
        self.isHidden = false
        UIView.animate(withDuration: duration!,
                       animations: { self.alpha = 1 },
                       completion: { (value: Bool) in
                          if let complete = onCompletion { complete() }
                       }
        )
    }

    func fadeOut(_ duration: TimeInterval? = 5, onCompletion: (() -> Void)? = nil) {
        UIView.animate(withDuration: duration!,
                       animations: { self.alpha = 0 },
                       completion: { (value: Bool) in
                           self.isHidden = true
                           if let complete = onCompletion { complete() }
                       }
        )
    }

}

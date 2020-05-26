//
//  OrganizationListTableViewController.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/18.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import Foundation
import UIKit

class OrganizationListTableViewController : UITableViewController {
    
     @IBOutlet weak var organaizationListTable: UITableView!
    
    var organizationDisplayNames:Array = ["Signarfy", "MagOS" ,"daColleget", "NuOrg"]
    var OrganizationDisplayImages:Array = [UIImage(named: "donut"),UIImage(named: "donut"),UIImage(named: "donut"),UIImage(named: "donut")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        organaizationListTable.delegate = self
        organaizationListTable.dataSource = self
    }
    
    
}


extension OrganizationListTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Selecting")
    }
    
}

extension OrganizationListTableViewController {
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "organizationCell", for: indexPath) as! OrganizationTableCell
        /*
        for var names in organizationDisplayNames{
            organzationName.text = names
        }
        for cell
        */
        
        cell.currentOrganizationImage.layer.cornerRadius = 5
        cell.organizationName.text = organizationDisplayNames[indexPath.row]
        cell.organizationDisplayImage.image = OrganizationDisplayImages[indexPath.row]
        
        return cell
    } 
}

class OrganizationTableCell : UITableViewCell {
    
    @IBOutlet weak var organizationName: UILabel!
    @IBOutlet weak var organizationDisplayImage: UIImageView!
    @IBOutlet weak var currentOrganizationImage: UIImageView!
    
    
}


extension OrganizationListTableViewController {
    
    func get_org(reqbody:[String:String]){
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
                    //self.loadingV(is_loading: false)
                self.present(openViewController(_storyboard:"App",idName: "testpage2", vc: HomeViewController()), animated: true, completion: nil)
                
                case 0:
                    //self.loadingV(is_loading: false)
                    print("Nope")
                showMessageDialog("Error", message: "Email or Password incorrect", image: nil, axis: .horizontal, viewController: self, handler: {
                    
                    // Clear password text field
                    //self.passwordTextField.text = ""
                    
                })
                    
                default:
                    print()
                }
            }
        
        }, errorCallback: { (err) in
            //KVNProgress.dismiss()
            if (err.containsIgnoringCase(find: "serialize") || err.containsIgnoringCase(find: "JSON")){
                DispatchQueue.main.async {
                   // self.loadingV(is_loading: false)
                    //self.delegate?.peachPay(self, didFailPaymentWithResult: ["error" : err as AnyObject])
                }
            }else{
               // self.loadingV(is_loading: false)
                showMessageDialog("Error", message: err, image: nil, axis: .horizontal, viewController: self, handler: {
                    
                })
            }
            print(err)
        })
        
    }
}

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

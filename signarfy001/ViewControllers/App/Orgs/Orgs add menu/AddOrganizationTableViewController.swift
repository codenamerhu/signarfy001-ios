//
//  AddOrganizationTableView.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/21.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import UIKit

class AddOrganizationTableViewController : UITableViewController {
    
    
    var cellName = "addOrgCell"
    var optionIcon = ["",""]
    var optionLabels = ["Joince an organization",
                       "Create an Organization"]
    
    @IBOutlet var addOrgTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addOrgTableView.delegate = self
        addOrgTableView.dataSource = self
    }
    
}

// table delegate
extension AddOrganizationTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        
        present(openViewController(_storyboard:"App",idName: "createOrg", vc: CreateOrganizationViewController()), animated: true, completion: nil)
    }
}

// table dataSource
extension AddOrganizationTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionLabels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! AddOrgCell
        
        cell.optionLabel.text = optionLabels[indexPath.row]
        
        return cell
    }
}

class AddOrgCell : UITableViewCell {
    
    
    @IBOutlet weak var forwardIcon: UIImageView!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var optionIcon: UIImageView!
}

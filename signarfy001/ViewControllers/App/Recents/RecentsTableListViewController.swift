//
//  RecentsTableListViewController.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/19.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import UIKit

class RecentsTableListViewController : UITableViewController {
    
    @IBOutlet var recentsTable: UITableView!
    
    var displayImages       = ["picrhu", "55", "55",  "33", "33", "55"]
    var userNames           = ["Rhulani Ndhlovu", "Curdy", "Big Zigg", "Roy", "Drake", "View News"]
    var LastMessagesFrom    = ["Rhulani (You):", "Curdy:", "Big:", "Rhulani (You):", "Drake:", "View:"]
    var messages            = ["A message to mself","Dude", "Hello", "Yo", "Damn, man you good", "Sending some love"]
    var dates               = ["02 May","02 May","02 May","02 May","02 May","02 May"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recentsTable.delegate = self
        recentsTable.dataSource = self
    }
}


extension RecentsTableListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
    
}


extension RecentsTableListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentsCell", for: indexPath) as! RecentsCell
        
        
        cell.displayImage.layer.cornerRadius = 5
        
        cell.displayImage.image     = UIImage(named: displayImages[indexPath.row])
        cell.userName.text          = userNames[indexPath.row]
        cell.lastMessageFrom.text   = LastMessagesFrom[indexPath.row]
        cell.message.text           = messages[indexPath.row]
        cell.date.text              = dates[indexPath.row]
        
        return cell
    }
}

class RecentsCell : UITableViewCell {
    
    @IBOutlet weak var displayImage : UIImageView!
    @IBOutlet weak var userName : UILabel!
    @IBOutlet weak var lastMessageFrom : UILabel!
    @IBOutlet weak var message : UILabel!
    @IBOutlet weak var date : UILabel!
    
    
}

//
//  MyUser.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/20.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import Foundation

class User {
    
    var user_id     : String!
    var first_name  : String!
    var last_name   : String!
    var username   : String!
    var email       : String!
    
    init(user_id: String, first_name: String, last_name: String, username: String, email: String){
        self.user_id    = user_id
        self.first_name = first_name
        self.last_name  = last_name
        self.username   = username
        self.email      = email

    }
    
}

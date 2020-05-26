//
//  Contants.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/14.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import Foundation
import UIKit
import Alamofire



public class Constants: NSObject {
    
    class func sandboxBaseURL() -> String { return "https://signarfy001.herokuapp.com/" }
    
    class func liveBaseURL () -> String { return "https://signarfy001.herokuapp.com/" }
    
    class func isConnectedToInternet() ->Bool { return NetworkReachabilityManager()!.isReachable }
    
    class func relativeURL()->Dictionary<String,String>{
        return [
            "LOGIN"     : "api/auth/login",
            "REGISTER"  : "api/auth/signup",
            "PAY"       : "api/payment/pay",
            "OTP"       : "api/auth/send-otp",
            
            "ADD-ORANIZATIONS" : "api/",
            
            "GET-ORG" : "api/messaging/create-organization",
            "GET-CHANNELS" : "api/messaging/create-channel",
            "GET-ORANIZATIONS" : "",
            
        ]
    }
    
}


struct Keys {
    static let full_name    = "full_name"
    static let first_name   = "first_name"
    static let last_name    = "last_name"
    static let username     = "username"
    static let user_id      = "user_id"
    static let is_logged_in = "is_logged_in"
    static let is_provider  = "is_provider"
}





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
            "REGISTER"  : "api/auth/register",
            "PAY"       : "api/payment/pay"
        ]
    }
    
}





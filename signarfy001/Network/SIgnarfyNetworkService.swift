//
//  NetworkService.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/15.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import Foundation
import Alamofire
import  UIKit

class SignarfyNetworkService:NSObject {
    
    
    class func login(_ bodyParam:Dictionary<String,Any>,resultCallback:@escaping (_ Result:Dictionary<String,AnyObject>?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        
        /*
        let headers = [
            "Content-Type": "application/json"
        ]*/
        //encoding: JSONEncoding.default, headers: nil
        
        let manager = AF
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        
        manager.request(URLHelper.getURL("LOGIN"),method: .post, parameters: bodyParam).responseJSON {
            //(res) -> Void in
            
         /*
            if(res.result.isSuccess){
                let result = res.result.value as! Dictionary<String,AnyObject>
                 print(result)
                resultCallback(result)
                
                
            }else{
                errorCallback( res.result.error!.localizedDescription)
            } */
         res in switch res.result {
            
             
         case .success(_):
             //print(res)
            
            
             //let da = "\(res.result)"
             let data = res.value as! Dictionary<String,AnyObject>
             print(data)
             
             let validate = data["isSuccessful"]
             print(validate!)
             
             
             if(Int(truncating: data["isSuccessful"]! as! NSNumber) == 0){
                print()
            }
            else {
                print("success")
                let result = res.value as! Dictionary<String,AnyObject>
                print("result: ")
                print(result)
                
                    resultCallback(data)
                
            }
            
             
             
             /*
             if (ar[8] == "4"){
                 print("something went wrong")
                 //errorCallback( res.error!.localizedDescription)
                 
             }else {
             let result = res.value as! Dictionary<String,AnyObject>
             print("result: ")
             print(result)
             
                // let data = result["data"] as? Dictionary<String,AnyObject>
                 resultCallback(result)
             } */
             
         case .failure(let errorOut):
             print(errorOut)
             errorCallback( res.error!.localizedDescription)
         }
        }
        
    }
    
    class func register(_ bodyParam:Dictionary<String,Any>,resultCallback:@escaping (_ Result:Dictionary<String,AnyObject>?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        
        /*
        let headers = [
            "Content-Type": "application/json"
        ]*/
        //encoding: JSONEncoding.default, headers: nil
        
        let manager = AF
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        
        manager.request(URLHelper.getURL("REGISTER"),method: .post, parameters: bodyParam).responseJSON {
            //(res) -> Void in
            
         /*
            if(res.result.isSuccess){
                let result = res.result.value as! Dictionary<String,AnyObject>
                 print(result)
                resultCallback(result)
                
                
            }else{
                errorCallback( res.result.error!.localizedDescription)
            } */
         res in switch res.result {
            
             
         case .success(_):
             //print(res)
            
            
             //let da = "\(res.result)"
             let data = res.value as! Dictionary<String,AnyObject>
             print(data)
             
             let validate = data["isSuccessful"]
             print(validate!)
             
             
             if(Int(truncating: data["isSuccessful"]! as! NSNumber) == 0){
                print()
            }
            else {
                print("success")
                let result = res.value as! Dictionary<String,AnyObject>
                print("result: ")
                print(result)
                
                    resultCallback(data)
                
            }
            
             
             
             /*
             if (ar[8] == "4"){
                 print("something went wrong")
                 //errorCallback( res.error!.localizedDescription)
                 
             }else {
             let result = res.value as! Dictionary<String,AnyObject>
             print("result: ")
             print(result)
             
                // let data = result["data"] as? Dictionary<String,AnyObject>
                 resultCallback(result)
             } */
             
         case .failure(let errorOut):
             print(errorOut)
             errorCallback( res.error!.localizedDescription)
         }
        }
    }
}

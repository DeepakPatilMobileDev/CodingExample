//
//  BaseAPIInteractor.swift
//  CodingExample
//
//  Created by Deepak P. Patil on 25/06/18.
//  Copyright © 2018 Deepak P. Patil. All rights reserved.
//

import Foundation
class BaseAPIInteractor{
    let requestParams:NSMutableDictionary? = nil
    var requestURL:String!
    
    // Keeping optionals as fin future Delegates can also be configured
    var successCompletion:((Any)->())? = nil
    var failedCompletion:((Error)->())? = nil
    
    func callApiWithCompletions(success:@escaping ((Any)->()) ,failure:@escaping ((Error)->())) {
        self.successCompletion = success
        self.failedCompletion = failure
        URLSession.shared.get(urlString: self.requestURL, timeout: 60.0, success: { (responseObject) in
            if (responseObject != nil) {
                let jsonObject = try? JSONSerialization.jsonObject(with: responseObject! as! Data, options: [])
                self.onRequestSuccess(responseData: jsonObject!)
            } else {
                    //TODO::  Create an Error here for data recived as nil and add further handling
                    // failure(error)
            }
        }) { (error) in
            self.onRequestFailure(error: error)
        }
    }
    
    func onRequestSuccess(responseData:Any){
        if let success = successCompletion {
            success(responseData)
        }else{
            //TODO:: check if Delegates are configured or any other case
        }
    }
    
    func onRequestFailure(error:Error){
        if let failure = failedCompletion {
            failure(error)
        }else{
            //TODO:: check if Delegates are configured or any other case
        }
    }
}

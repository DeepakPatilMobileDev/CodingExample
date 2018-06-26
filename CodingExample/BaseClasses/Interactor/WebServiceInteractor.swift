//
//  WebServiceInteractor.swift
//  CodingExample
//
//  Created by Deepak P. Patil on 25/06/18.
//  Copyright © 2018 Deepak P. Patil. All rights reserved.
//

import UIKit

 let responseSuccessStatusCode:NSNumber = 200

extension URLSession {
    /*
     Post Request
     */
    func post(urlString:String,params:NSMutableDictionary,timeout:TimeInterval,success:@escaping (_ response:Any?)->(),failure:@escaping (_ error:Error)->()){
        
        var postRequest:URLRequest = URLRequest(url: URL(string: urlString)!)
        postRequest.timeoutInterval = timeout
        postRequest.httpMethod = "POST"
        postRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        postRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var requestData:Data! =  nil
        do {
            requestData =  try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch let error1 as Error?{
            failure(error1!)
        }
        
        postRequest.setValue(String(format:"%d",requestData as CVarArg), forHTTPHeaderField: "Content-Length")
        postRequest.httpBody = requestData
        
        // print requestjson
        let reqestStr:NSString = NSString.init(data: requestData, encoding: String.Encoding.utf8.rawValue)!
        print(reqestStr)
        
        let dataTask:URLSessionDataTask = self.dataTask(with: postRequest) { (data, response, error) in
            if error == nil {
                success(data)
            }else {
                failure(error!)
            }
        }
        dataTask.resume()
    }
    
    func get(urlString:String,timeout:TimeInterval,success:@escaping (_ response:Any?)->(),failure:@escaping (_ error:Error)->()){
        
        var postRequest:URLRequest = URLRequest(url: URL(string: urlString)!)
        postRequest.timeoutInterval = timeout
        postRequest.httpMethod = "GET"
        
        let dataTask:URLSessionDataTask = self.dataTask(with: postRequest) { (data, response, error) in
            if error == nil {
                success(data)
            }else {
                failure(error!)
            }
        }

        dataTask.resume()
    }
    
    /*
     // TODO:: add Image Download
     */
    
    func downloadImageFromURL(urlString:String,onImageDownloaded: @escaping (Data)->(),failure:@escaping (_ error:Error)->()){
        let downloadTask:URLSessionDownloadTask =  self.downloadTask(with: URL(string: urlString)!) { (url, response, downloadError) in
            if downloadError == nil{
            
                do{
                    let dataWithURL = try Data(contentsOf: url!)
                    onImageDownloaded(dataWithURL)
                }catch {
                    failure(error)
                }
            } else {
                failure(downloadError!)
            }
        }
    downloadTask.resume()
    
    }
    
    /*
     // TODO:: cache
     */
    
    
    /*
     // TODO:: Add your server Trust code here SLL pinnig or Publickeys
     */
}

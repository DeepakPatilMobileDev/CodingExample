//
//  ApplicationRouter.swift
//  CodingExample
//
//  Created by Deepak P. Patil on 25/06/18.
//  Copyright © 2018 Deepak P. Patil. All rights reserved.
//

import UIKit



class ApplicationRouter{
    /*
    - Can be said as a Router for Application Launches
    - Lets AppDelegate to only Register and Recive respective Events
    */
    private init() {}  // Multiple Instances are not required as of now
    
    // As we are not maintaing any stored properties for now so we can keep functionalities at class level only for now
   public static func intializeAndLaunchApplication(){

        let mainViewController:CountryListViewController = CountryListViewController(nibName: "CountryListViewController", bundle: nil);
        getAppDelegate().navigationController = UINavigationController(rootViewController: mainViewController)
        getAppDelegate().window = UIWindow(frame: UIScreen.main.bounds)
        getAppDelegate().window?.makeKeyAndVisible()
        getAppDelegate().window?.rootViewController = getAppDelegate().navigationController
        
    }
    
    public static func getAppDelegate() -> AppDelegate {
        return  UIApplication.shared.delegate as! AppDelegate
    }
 
    
    /* Add Methods for
     1: Launch with options Flows
     2: siri Flows
     3: 3d touch Flows
     4: Notification Flows
     5: Spot Light Flows
     */
    
    
}

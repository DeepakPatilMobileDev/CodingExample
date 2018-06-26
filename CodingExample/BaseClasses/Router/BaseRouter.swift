//
//  BaseRouter.swift
//  CodingExample
//
//  Created by Deepak P. Patil on 26/06/18.
//  Copyright © 2018 Deepak P. Patil. All rights reserved.
//

import Foundation
class BaseRouter {
    /*
 1: Add your base u7 Common Code For custom Navigation
 2: PUshing, Poping and Presenting VC's
 3: animations during navigations etc,
 4: Managing Navigation Stack
 5: Replacing Root View Controllers
 etc.
 */
    
    func pushViewController(viewController:BaseViewController, animnated:Bool){
        let navigationCon = ApplicationRouter.getAppDelegate().navigationController
        navigationCon?.pushViewController(viewController, animated: animnated)
    }
}

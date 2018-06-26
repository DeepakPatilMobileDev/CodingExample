//
//  CountryModuleRouter.swift
//  CodingExample
//
//  Created by Deepak P. Patil on 26/06/18.
//  Copyright © 2018 Deepak P. Patil. All rights reserved.
//

import Foundation
class  CountryModuleRouter: BaseRouter {
    func lauchFlagImageController(countryData:CountryEntity){
       
        let flagVC:FlagViewController = FlagViewController.init(countryData: countryData)
        self.pushViewController(viewController: flagVC as BaseViewController, animnated: false)
        // Do any more initializations, action you wanted to do wiht VC if needed
        
    }
}

//
//  FlagViewPresenter.swift
//  CodingExample
//
//  Created by Deepak P. Patil on 26/06/18.
//  Copyright © 2018 Deepak P. Patil. All rights reserved.
//

import Foundation
import Foundation
import UIKit
class  FlagViewPresenter {
    var countryFlagInteractor:CountryFlagInteractor = CountryFlagInteractor()
    func fetchImageOfCountry(flagUrl:String,onImageFetched:@escaping (UIImage)->()) {
        
        countryFlagInteractor.getcountryFlag(stringURL: flagUrl) { (flagImage) in
            // Resize Image or do other operatoins on Image
            onImageFetched(flagImage);
            
        }
    }
}

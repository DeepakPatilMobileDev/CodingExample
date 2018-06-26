//
//  CountryFlagInteractor.swift
//  CodingExample
//
//  Created by Deepak P. Patil on 26/06/18.
//  Copyright © 2018 Deepak P. Patil. All rights reserved.
//

import UIKit

class CountryFlagInteractor: BaseAPIInteractor {
 
    func getcountryFlag(stringURL:String,onImageDataDownloaded:@escaping (UIImage)->()){
        self.requestURL = stringURL
        self.downloadImageFromURL(success: { (data) in
            let image:UIImage = UIImage(data: data as! Data)!
           onImageDataDownloaded(image)
        }) { (error) in
            // Show Error Message for Image download
        }
    }
}

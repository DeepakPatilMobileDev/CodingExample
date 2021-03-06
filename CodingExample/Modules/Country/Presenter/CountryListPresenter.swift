//
//  CountryListPresenter.swift
//  CodingExample
//
//  Created by Deepak P. Patil on 25/06/18.
//  Copyright © 2018 Deepak P. Patil. All rights reserved.
//

import Foundation
import UIKit
class  CountryListPresenter {
    var countryListInteractor:GetCountriesDataInteractor = GetCountriesDataInteractor(urlString: "http://www.geognos.com/api/en/countries/info/all.json");
    var countryListArray:[CountryEntity] = []
    var countryRouter = CountryModuleRouter()
    
    
    public func fetchAndLoadCountryList(onCountryListDownloaded:@escaping ()->()){
        countryListInteractor.callGetCountriesDataApiWith(onContriesDataRecived: { (countriesArray) in
        print(countriesArray.count)
            self.countryListArray = countriesArray
                onCountryListDownloaded()
            //Improvement: Manupulate data like filter,Sort,group, have specific data redirected to view etc
        
            // TODO:: load data to UI  via Delegates or Clousers
        
        }) { (message) in
         // TODO::  Display Error Message
        }
    }
    
    func onSelectingCountryAtIndex(index:Int){
        countryRouter.lauchFlagImageController(countryData: countryListArray[index])
    }

   
    
}

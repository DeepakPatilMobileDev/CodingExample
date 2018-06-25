//
//  GetCountriesDataInteractor.swift
//  CodingExample
//
//  Created by Deepak P. Patil on 25/06/18.
//  Copyright © 2018 Deepak P. Patil. All rights reserved.
//

import Foundation
class GetCountriesDataInteractor:BaseAPIInteractor {
    var onContriesDataRecivedCompletion:(([CountryEntity])->())? = nil
    var onRequestFailureCompletion:((String)->())? =  nil
    
    init(urlString:String) {
        super.init()
        requestURL = urlString
    }
    

    func callGetCountriesDataApiWith( onContriesDataRecived:@escaping ([CountryEntity]) -> (),  onRequestFailure:@escaping (String) -> ())  {
        onContriesDataRecivedCompletion = onContriesDataRecived
        onRequestFailureCompletion = onRequestFailure
        self.callApiWithCompletions(success: { (jsonObject) in
            self.parseJsonData(jsonObject: jsonObject)
        }) { (error) in
            
        }
    }
    
    func parseJsonData(jsonObject:Any){
        let responseDictionary = jsonObject as! Dictionary<String,Any>
        var countriesArray:[CountryEntity] = []
        
        let statusCode:NSNumber = responseDictionary["StatusCode"] as! NSNumber
        if statusCode == responseSuccessStatusCode {
            let results:Dictionary = responseDictionary["Results"] as! Dictionary<String,Any>
            
            for (_, dataDic) in results {
                let country = CountryEntity.init(countryDataDictionary: dataDic as! Dictionary<String, Any>)
                countriesArray.append(country)
            }
            
            if onContriesDataRecivedCompletion != nil{
                onContriesDataRecivedCompletion!(countriesArray)
            }
            
        } else {
            // TODO:: fail with Message to be displayed to user on screen
        }
  
    }
}

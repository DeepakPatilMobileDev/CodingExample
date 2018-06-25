//
//  CountryEntity.swift
//  CodingExample
//
//  Created by Deepak P. Patil on 25/06/18.
//  Copyright © 2018 Deepak P. Patil. All rights reserved.
//

import Foundation

struct CountryEntity {
    var coutryName:String
    var capatilName:String
    var flagCode:String
    // TODO:: Try to update with Codable and do Exception Handling for null
    //Improvement:  can add function to set a new computed value a Region = Asia , Europe etc
    init(countryDataDictionary:Dictionary<String,Any>) {

        coutryName = countryDataDictionary["Name"] as! String
        if (countryDataDictionary["Capital"] != nil  && countryDataDictionary["Capital"] is Dictionary<String,Any>) {
            capatilName = (countryDataDictionary["Capital"] as! Dictionary<String,Any>) ["Name"] as! String
        }else {
            capatilName = "No Capital"
        }
        flagCode = (countryDataDictionary["CountryCodes"] as! Dictionary<String,Any>) ["iso2"] as! String
    }
    
    func getFlagURL() -> (String) {
        return "http://www.geognos.com/api/en/countries/flag/\(flagCode).png"
    }
    
}

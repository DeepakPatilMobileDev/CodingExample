//
//  CountryListVCTableViewExtension.swift
//  CodingExample
//
//  Created by Deepak P. Patil on 26/06/18.
//  Copyright © 2018 Deepak P. Patil. All rights reserved.
//

/*
 Note-  Could also have written these extensions
 */
import Foundation
import  UIKit
extension CountryListViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        countryPresenter.onSelectingCountryAtIndex(index: indexPath.row)
    }
}

extension CountryListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  self.countryPresenter.countryListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return cell
        }()
        
        let country:CountryEntity = self.countryPresenter.countryListArray[indexPath.row]
        cell.textLabel?.text = country.coutryName
//        cell.detailTextLabel?.text = "Select to see country image Flag"
        return cell
    }

}

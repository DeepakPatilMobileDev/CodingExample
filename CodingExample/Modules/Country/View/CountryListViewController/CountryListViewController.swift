//
//  CountryListViewController.swift
//  CodingExample
//
//  Created by Deepak P. Patil on 25/06/18.
//  Copyright © 2018 Deepak P. Patil. All rights reserved.
//

import UIKit

class CountryListViewController: BaseViewController {
    let countryPresenter:CountryListPresenter  = CountryListPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Country List(VIPER Design)"
        // Do any additional setup after loading the view.
        countryPresenter.fetchAndLoadCountryList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

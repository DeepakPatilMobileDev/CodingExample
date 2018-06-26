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
    
    @IBOutlet weak var countryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countryPresenter.fetchAndLoadCountryList {
            self.countryTableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Country List(VIPER Design)"
    }
 
}

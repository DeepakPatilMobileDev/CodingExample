//
//  FlagViewController.swift
//  CodingExample
//
//  Created by Deepak P. Patil on 26/06/18.
//  Copyright © 2018 Deepak P. Patil. All rights reserved.
//

import UIKit
/*
 Note : We cann have a seperate Interactor & Presenter and Router for this but scope is small so using the existing one only
 */
class FlagViewController: BaseViewController {
    
    @IBOutlet weak var flagImageView: UIImageView!
    var countryPresenter:CountryListPresenter
    var countryData:CountryEntity
    
    init(presenter:CountryListPresenter ,countryData:CountryEntity) {
        self.countryPresenter = presenter
        self.countryData = countryData
        super.init(nibName: String(describing: FlagViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryPresenter.fetchImageOfCountry(flagUrl: self.countryData.getFlagURL()) { (flagIamge) in
            self.flagImageView.image = flagIamge
        }
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Country ::\(self.countryData.coutryName)"
    }
    
}

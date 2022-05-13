//
//  ViewController.swift
//  ShuShanWeather
//
//  Created by yuming zheng on 4/29/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    
    let locationManager = CLLocationManager()
    let weather = Weather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
    }


}


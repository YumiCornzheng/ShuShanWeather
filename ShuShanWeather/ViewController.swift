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
        
        print("debug")
        locationManager.requestWhenInUseAuthorization()//请求授权获取当前位置
        locationManager.delegate = self//委托代理
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers//经度 千米
        locationManager.requestLocation()
    }
    
    //当点击查询返回时,将上个页面的city名字带回上个页面
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? QueryViewController{
            vc.currentCity = weather.city
            vc.delegat = self
        }
    }
    

}


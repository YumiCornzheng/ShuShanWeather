//
//  ViewController-CLLocationManagerDelegate.swift
//  ShuShanWeather
//
//  Created by yuming zheng on 5/13/22.
//

import Foundation
import CoreLocation
import Alamofire
import SwiftyJSON

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lon = locations[0].coordinate.longitude //经度
        let lat = locations[0].coordinate.latitude//纬度
        let parameter = ["location":"\(lon),\(lat)","key": kQWeatherWebKey]
        AF.request(kQWeatherNowPath,parameters: parameter).responseJSON{ response in
            if let data = response.value{
                let weatherJson = JSON(data)
                self.showWeather(weatherJson)
            }
        }
        
        AF.request(kQWeatherCityPath,parameters: parameter).responseJSON{ response in
            if let data = response.value{
                let cityJSON = JSON(data)
                self.showCity(cityJSON)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
        cityLabel.text = "信息获取失败"
    }
}

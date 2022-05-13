//
//  ViewController-CLLocationManagerDelegate.swift
//  ShuShanWeather
//
//  Created by yuming zheng on 5/13/22.
//

import Foundation
import CoreLocation

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lon = locations[0].coordinate.longitude //经度
        let lat = locations[0].coordinate.latitude//纬度
        let parameter = ["location":"\(lon),\(lat)","key": ]
    }
}

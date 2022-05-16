//
//  ViewController-helper.swift
//  ShuShanWeather
//
//  Created by yuming zheng on 5/13/22.
//

import Foundation
import SwiftyJSON

extension ViewController{
    func showWeather(_ WeatherJson: JSON){
        weather.temp = "\(WeatherJson["now","temp"].stringValue)°"
        weather.icon = WeatherJson["now","icon"].stringValue
        if WeatherJson["now","temp"].stringValue == "" {
            tempLabel.text = "无数据"
        }else{
            tempLabel.text = weather.temp
        }
        iconImageView.image = UIImage(named: weather.icon)
    }
    
    func showCity(_ WeatherJSON: JSON){
        weather.city = WeatherJSON["location",0,"name"].stringValue
        if weather.city == "" {
            cityLabel.text = "请输入正确城市名称"
        }else{
            cityLabel.text = weather.city
        }
        
    }
}

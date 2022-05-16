//
//  ViewController-QueryViewControllerAelegate.swift
//  ShuShanWeather
//
//  Created by yuming zheng on 5/13/22.
//

import Foundation
import Alamofire
import SwiftyJSON

extension ViewController : QueryViewControllerAelegate{
    func didChangeCity(city: String) {
        let parameter = ["location":city,"key":kQWeatherWebKey]
        AF.request(kQWeatherCityPath,parameters: parameter).responseJSON{ response in
            if let data = response.value{
                let cityJSON = JSON(data)
                self.showCity(cityJSON)
                
                let parameter = ["location": cityJSON["location",0,"id"].stringValue,"key":kQWeatherWebKey]
                AF.request(kQWeatherNowPath,parameters: parameter).responseJSON{ response in
                    if let data = response.value{
                        let cityJSON = JSON(data)
                        self.showWeather(cityJSON)
                    }
                }
            }
        }
    }
}

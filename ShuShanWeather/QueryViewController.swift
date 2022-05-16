//
//  QueryViewControllerAelegate.swift
//  ShuShanWeather
//
//  Created by yuming zheng on 5/13/22.
//

import Foundation
import UIKit

protocol QueryViewControllerAelegate{
    func didChangeCity(city: String)
}

class QueryViewController: UIViewController {
    var currentCity = ""
    var delegat: QueryViewControllerAelegate?


    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet weak var cityTextfield: UITextField!
    @IBAction func back(_ sender: Any) { dismiss(animated: true)}
    @IBAction func query(_ sender:Any){
        dismiss(animated: true)
        if !cityTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            delegat?.didChangeCity(city: cityTextfield.text!)
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentCityLabel.text = currentCity
        cityTextfield.becomeFirstResponder()
    }
}

//
//  BrandCarModels.swift
//  carTalk
//
//  Created by 용상호 on 2021/02/24.
//

import UIKit

struct BrandCarModels: Codable {

    var name: String
    var models: [BrandCarInfo]

    var toDictionary:[String:Any] {
        let carsArray = models.map{ $0.toDictionary }
        let dict: [String:Any] = ["name" : name, "models" : carsArray]
        return dict
    }
    
    
}


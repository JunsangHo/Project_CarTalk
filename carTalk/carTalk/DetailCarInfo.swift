//
//  DetailCarInfo.swift
//  carTalk
//
//  Created by 용상호 on 2021/02/23.
//

import UIKit

struct DetailCarInfo{
    var carImg: UIImage!
    var carName: String!
    var carPrice: String!
    var consumption: String!
    var power: String!
    var sale: String!
    var fuelType: String!
    
    init() {
        self.carName = "-"
        self.carPrice = "-"
        self.consumption = "-"
        self.power = "-"
        self.sale = "-"
        self.fuelType = "-"
        
    }
}

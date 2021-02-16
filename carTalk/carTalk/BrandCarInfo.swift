//
//  BrandCarInfo.swift
//  carTalk
//
//  Created by 용상호 on 2021/02/17.
//

import UIKit

struct BrandCarInfo {
    let name: String
    let minNewCarPrice: Int
    let maxNewCarPrice: Int
    let minUsedCarPrice: Int
    let maxUsedCarPrice: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name:String, minNewCarPrice: Int, maxNewCarPrice: Int, minUsedCarPrice: Int, maxUsedCarPrice: Int){
        self.name = name
        self.minNewCarPrice = minNewCarPrice
        self.maxNewCarPrice = maxNewCarPrice
        self.minUsedCarPrice = minUsedCarPrice
        self.maxUsedCarPrice = maxUsedCarPrice
    }
    
}

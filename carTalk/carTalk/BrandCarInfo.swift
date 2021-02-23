//
//  BrandCarInfo.swift
//  carTalk
//
//  Created by 용상호 on 2021/02/17.
//

import UIKit

struct BrandCarInfo :Codable {
    let name: String
    let address: String
    let englishName : String
    let era : String
    
    
    enum CodingKeys : String, CodingKey{
        case name = "name"
        
        case address = "url"
        
        case englishName = "EngName"
        
        case era = "era"
        
    }
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name:String, englishName: String, era: String, url: String){
        self.name = name
        self.address = url
        self.englishName = englishName
        self.era = era
    }
    
    var toDictionary:[String:Any] {
        let dict: [String:Any] = ["name": name, "address": address, "englishName": englishName, "era": era]
        return dict
    }
    
}

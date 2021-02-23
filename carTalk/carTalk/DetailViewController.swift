//
//  DetailViewController.swift
//  carTalk
//
//  Created by 권준상 on 2021/02/22.
//

import UIKit

class DetailViewController: UIViewController {

    
    let viewModel = DetailViewModel()
    
    @IBOutlet weak var carImg: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var consumption: UILabel!
    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var sale: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var fuelType: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI(){
        self.carImg.image = self.viewModel.detailCarInfo.carImg
        self.carName.text = self.viewModel.detailCarInfo.carName
        self.consumption.text = self.viewModel.detailCarInfo.consumption
        self.power.text = self.viewModel.detailCarInfo.power
        self.sale.text = self.viewModel.detailCarInfo.sale
        self.price.text = self.viewModel.detailCarInfo.carPrice
        self.fuelType.text = self.viewModel.detailCarInfo.fuelType
    }
}


class DetailViewModel {
    var address: String
    var detailCarInfo =  DetailCarInfo()
    
    func setDetail(temp: DetailCarInfo){
        self.detailCarInfo = temp
    }
    
    init(){
        address = " "
    }
}

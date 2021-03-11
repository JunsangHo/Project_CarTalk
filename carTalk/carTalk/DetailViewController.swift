//
//  DetailViewController.swift
//  carTalk
//
//  Created by 권준상 on 2021/02/22.
//

// 0309 1650
import UIKit
import SwiftSoup
import FirebaseUI

class DetailViewController: UIViewController {

    var carSpecificationListViewController: SpecificationViewController!
    let viewModel = DetailViewModel()
    
    @IBOutlet weak var carImg: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var consumption: UILabel!
    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var sale: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var fuelType: UILabel!
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "specification" {
            let destinationVC = segue.destination as? SpecificationViewController
            carSpecificationListViewController = destinationVC
            carSpecificationListViewController.viewModel.fetchItems()
        }
//        else if segue.identifier == "login" {
//            let dstVC = segue.destination as? LoginViewController
//
//
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        viewModel.getDetail(){ temp in
            print(temp)
        }
    }
    @IBAction func login(_ sender: Any) {
        self.performSegue(withIdentifier: "login", sender: nil)
    }
    
    @IBAction func logoutButtonTouched(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        self.dismiss(animated: true, completion: nil)
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
    
    func getDetail(completion: @escaping (SpecificationInfo) -> ()) {
        let urlAddress = detailCarInfo.specificationURL!
        var specInfo = SpecificationInfo()
        guard let url = URL(string: urlAddress) else { return }
        do{
            
//            let html = try String(contentsOf: url, encoding: .utf8)
//            let doc: Document = try SwiftSoup.parse(html)
//            let trimNum: Elements = try doc.select(".lineup_top_sliding").select(".tit").select(".desc").select("q").select("span")
//            print(try trimNum.text())
//            let trim: Elements = try doc.select(".lineup_top_sliding").select(".col_wrap").select(".col").select(".price_section").select("dl").select("dt")
//            specInfo.trimName = try trim.text()


            completion(specInfo)
        } catch let error {
            print(error)
        }
    }
    init(){
        address = " "
    }
}

struct SpecificationInfo {
    var trimNum: Int!
    var trimName: String!
    var trimPrice: String!
    var engineType: String!
    var displacement: String!
    var fuelTypeDetail: String!
    
    var maximumPower: String!
    var maximumTorque: String!
    var overallLength: String!
    var overallWidth: String!
    var overallHeight: String!
    
    var wheelBase: String!
    var curbWeight: String!
    var occupancy: String!
    var drivingSystem: String!
    var transmission: String!
    
    init() {
        self.trimNum = 0
        self.trimName = "-"
        self.trimPrice = "-"
        self.engineType = "-"
        self.displacement = "-"
        self.fuelTypeDetail = "-"
        
        self.maximumPower = "-"
        self.maximumTorque = "-"
        self.overallLength = "-"
        self.overallWidth = "-"
        self.overallHeight = "-"
        
        self.wheelBase = "-"
        self.curbWeight = "-"
        self.occupancy = "-"
        self.drivingSystem = "-"
        self.transmission = "-"
    }
}

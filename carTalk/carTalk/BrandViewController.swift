//
//  BrandViewController.swift
//  carTalk
//
//  Created by 용상호 on 2021/02/14.
//

import UIKit


class BrandViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    
    
    
    //MARK: 권준상이 건든것 : BrandViewModel 안에 brandName, setName , viewDidLoad 안에 있는 print() (잘 전달됬는지 확인용)
    //Model -> 지금은 임시지만 나중에는 서버와 연결
    
    // View -> carCell
    // carCell에 필요한 정보를 ViewModel을 통해 받아야 함
    // ViewModel로부터 받은 정보로 업데이트 되어야 함
    
    // ViewModel
    // CarViewModel 을 만들고 View 레이어에서 필요한 메서드들을 담아야 한다.
    
    let viewModel = BrandViewModel()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.brandCarList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "brandCarCell",for: indexPath) as? CarCell {
            let tmp = viewModel.brandCarList[indexPath.row]
            cell.name.text = tmp.name
            cell.newPrice.text = "\(tmp.minNewCarPrice) ~ \(tmp.maxNewCarPrice) 만원"
            cell.usedPrice.text = "\(tmp.minUsedCarPrice) ~ \(tmp.maxUsedCarPrice) 만원"
            cell.imgView.image = tmp.image
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    @IBOutlet weak var topBrandName: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.

        //print(viewModel.brandName!) // 잘 전달됬는지 확인
       // print(viewModel.brand.brandName!)
//        switch (viewModel.brandName!) {
//        case "hyundai":
//            topBrandName.text = "현대"
//            // fetchBrandCar(viewModel.brandName)
//        case "kia":
//            topBrandName.text = "기아"
//        case "chevrolet":
//            topBrandName.text = "쉐보레"
//        case "renault":
//            topBrandName.text = "르노삼성"
//        case "ssangyong":
//            topBrandName.text = "쌍용"
//        default:
//            topBrandName.text = "오류"
//        }

        
        
    }
    

}



class CarCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var newPrice: UILabel!
    @IBOutlet weak var usedPrice: UILabel!
    @IBOutlet weak var imgView : UIImageView!
    
}

class BrandViewModel {
    
    // MARK: String?으로 brandName 전달
    var brand: Brand?
    var brandName: String?
    func setName(model: String?) {
        brandName = model
    }

    func setBrand(model: Brand?){
        brand = model
    }
    
    init(){
        self.brandCarList = []
    }
//    let brandCarList: [BrandCarInfo] = [
//        BrandCarInfo(name: "그랜저", minNewCarPrice: 3172, maxNewCarPrice: 4349, minUsedCarPrice: 2200, maxUsedCarPrice: 4349),
//        BrandCarInfo(name: "소나타", minNewCarPrice: 2386, maxNewCarPrice: 3642, minUsedCarPrice: 2100, maxUsedCarPrice: 3400),
//        BrandCarInfo(name: "아반떼", minNewCarPrice: 1570, maxNewCarPrice: 2779, minUsedCarPrice: 1300, maxUsedCarPrice: 2432),
//        BrandCarInfo(name: "투싼", minNewCarPrice: 2435, maxNewCarPrice: 3567, minUsedCarPrice: 2264, maxUsedCarPrice: 3319)
//
//    ]
    
    let brandCarList : [BrandCarInfo]

    
    

}

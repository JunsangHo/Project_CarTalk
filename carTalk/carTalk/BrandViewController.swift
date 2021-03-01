//
//  BrandViewController.swift
//  carTalk
//
//  Created by 용상호 on 2021/02/14.
//

import UIKit
import SwiftSoup


class BrandViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: 권준상이 건든것 : BrandViewModel 안에 brandName, setName , viewDidLoad 안에 있는 print() (잘 전달됬는지 확인용)
    //Model -> 지금은 임시지만 나중에는 서버와 연결
    
    // View -> carCell
    // carCell에 필요한 정보를 ViewModel을 통해 받아야 함
    // ViewModel로부터 받은 정보로 업데이트 되어야 함
    
    // ViewModel
    // CarViewModel 을 만들고 View 레이어에서 필요한 메서드들을 담아야 한다.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCarDetail" {
            let vc = segue.destination as? DetailViewController
            if let temp = sender as? DetailCarInfo {
                vc?.viewModel.setDetail(temp: temp)
            }
        }
    }
    
    
    let viewModel = BrandViewModel()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel.models?.models.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "brandCarCell",for: indexPath) as? CarCell {
//            let tmp = viewModel.brand?.cars[indexPath.row]
            let tmp = viewModel.models?.models[indexPath.row]
            cell.name.text = tmp!.name
//            cell.newPrice.text = "\(tmp!.minNewCarPrice) ~ \(tmp!.maxNewCarPrice) 만원"
//            cell.usedPrice.text = "\(tmp!.minUsedCarPrice) ~ \(tmp!.maxUsedCarPrice) 만원"
            cell.era.text = tmp!.era
//            let url = URL(string: tmp!.address)!
//            do{
//                let html = try String(contentsOf: url, encoding: .utf8)
//                let doc: Document = try SwiftSoup.parse(html)
//
//
//                let mainImg: Elements = try doc.select("div#carMainImgArea.img_group").select("div.main_img").select("img[src]")
//                    let imgAddress = try mainImg.attr("src").description
//                    let url = URL(string: imgAddress)
//                    let data = try Data(contentsOf: url!)
//                cell.imgView.image = UIImage(data: data)
//            } catch let error {
//                print(error)
//            }
            
//            detailCar.carImg = UIImage(data: data)
            cell.imgView.image = UIImage(named: "\(tmp!.englishName).jpg")
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tmp = viewModel.models?.models[indexPath.row]
        self.viewModel.getCar(url: tmp!.address, carName: tmp!.name) { temp in
            self.performSegue(withIdentifier: "showCarDetail", sender: temp)
        }
    }
    
    @IBOutlet weak var topBrandName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        //print(viewModel.brandName!) // 잘 전달됬는지 확인
        //print(viewModel.brand?.brandName)
//        switch (viewModel.models?.name) {
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
        topBrandName.text = viewModel.models?.name
        
        
    }
    

}



class CarCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var era: UILabel!
    @IBOutlet weak var imgView : UIImageView!
}

class BrandViewModel {
    
    // MARK: String?으로 brandName 전달
    var brand: Brand?
    var models: BrandCarModels?
    
    func getCarImg(url: String, carName: String, completion: @escaping (DetailCarInfo) -> ()){
//        DispatchQueue.main.async {
//            UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        }
        let urlAddress = url
        var detailCar = DetailCarInfo()
        detailCar.carName = carName
        guard let url = URL(string: urlAddress) else { return }
        do{
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
            
            
            let mainImg: Elements = try doc.select("div#carMainImgArea.img_group").select("div.main_img").select("img[src]")
                let imgAddress = try mainImg.attr("src").description
                let url = URL(string: imgAddress)
                let data = try Data(contentsOf: url!)
                detailCar.carImg = UIImage(data: data)
            
            completion(detailCar)
        } catch let error {
            print(error)
        }
    }
    
    func getCar(url: String, carName: String, completion: @escaping (DetailCarInfo) -> ()){
//        DispatchQueue.main.async {
//            UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        }
        let urlAddress = url
        var detailCar = DetailCarInfo()
        detailCar.carName = carName
        guard let url = URL(string: urlAddress) else { return }
        do{
            //MARK: 메인화면의 정보들
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
            
            let price: Elements = try doc.select(".sale").select(".price").select("span")
            var cnt = 0
            for i in price{
                if cnt == 1{
                    detailCar.carPrice = try price.text()
                    break
                }
                cnt += 1
            }

            let others: Elements = try doc.select(".detail_lst").select("dd")
            var count = 0
            for i in others {
                if count == 0{
                    detailCar.consumption = try i.text()
                }
                else if count == 1{
                    detailCar.fuelType = try i.text()
                }
                else if count == 2 {
                    detailCar.power = try i.text()
                }
                else if count == 3{
                    detailCar.sale = try i.text()
                }
                count += 1
            }
            let mainImg: Elements = try doc.select("div#carMainImgArea.img_group").select("div.main_img").select("img[src]")
                let imgAddress = try mainImg.attr("src").description
                let url = URL(string: imgAddress)
                let data = try Data(contentsOf: url!)
                detailCar.carImg = UIImage(data: data)
            
            //MARK: 제원 정보들
            
            completion(detailCar)
        } catch let error {
            print(error)
        }
    }
    
    func setModel(model: BrandCarModels?){
        models = model
    }
    
    init(){
        self.brandCarList = []
    }

    
    let brandCarList : [BrandCarInfo]

}

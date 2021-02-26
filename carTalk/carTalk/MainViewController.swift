//
//  ViewController.swift
//  carTalk
//
//  Created by 용상호 and 권준상 on 2021/02/13.
//

import UIKit
import Firebase

enum SegueIdentifier: String {
    case detailSegue = "ShowBrandModels"
    
    case cardetailSegue = "car"
}

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var menuButton: UIButton! // 상위 메뉴 버튼
    @IBOutlet weak var searchButton: UIButton! // 상위 검색 버튼
    
//    var tmpBrand: Brand
//
//    func getBrand(index : Int)-> Brand{
//        tmpBrand =
//
//    }
    
    
    
    // 데이터 전송 준비
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowBrandModels" {
            let vc = segue.destination as? ModelsViewController
            if let brand = sender as? Brand {
                vc?.viewModel.setBrand(model: brand)
            }
        }
    }
    
    let viewModel = MainViewModel()
    
    // 몇개의 셀 사용할 것인지?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfitem
    }
    
    // 셀을 어떻게 구성할 것인지?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCell", for: indexPath) as? BrandCell else {
            return UICollectionViewCell()
        }
        let brandinfo = viewModel.getInfo(index: indexPath.item)
        cell.updateUI(brandInfo: brandinfo)
        return cell
    }
    
    // 클릭하면 어떻게 할 것인지?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.getBrand(index: indexPath.row) {  brand in
            self.performSegue(withIdentifier: SegueIdentifier.detailSegue.rawValue, sender: brand)
        }
        
    }
    
    // 셀의 레이아웃을 어떻게 설정할 것인지?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemspacing: CGFloat = 3
        let textAreaHeight: CGFloat = 10
        let width: CGFloat = (collectionView.bounds.width-itemspacing)/6
        let height: CGFloat = width + textAreaHeight
        return CGSize(width: width, height: height)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// 커스텀 셀 클래스
class BrandCell: UICollectionViewCell {
    
    @IBOutlet weak var brandImage: UIImageView! // 브랜드 이미지
    @IBOutlet weak var brandLabel: UILabel! // 브랜드 이름
    
    func updateUI(brandInfo: BrandInfo) {
        brandImage.image = brandInfo.image
        switch (brandInfo.brandName) {
        case "Hyundai":
            brandLabel.text = "현대"
        case "Kia":
            brandLabel.text = "기아"
        case "Chevrolet":
            brandLabel.text = "쉐보레"
        case "Renault":
            brandLabel.text = "르노삼성"
        case "Ssangyong":
            brandLabel.text = "쌍용"
        default:
            brandLabel.text = "오류"
        }
    }
}

class MainViewModel {
    let brandList: [BrandInfo] = [
        BrandInfo(brandName: "Hyundai"),
        BrandInfo(brandName: "Kia"),
        BrandInfo(brandName: "Chevrolet"),
        BrandInfo(brandName: "Renault"),
        BrandInfo(brandName: "Ssangyong"),
    ]
    
    var numOfitem: Int {
        return brandList.count
    }
    
    func getInfo(index: Int) -> BrandInfo {
        return brandList[index]
    }
    
    
 
//    var tmpBrand : Brand
    let db = Database.database().reference()
    

    
    func getBrand(index: Int, completion: @escaping (Brand) -> Void) {
        var tmp = Brand()
        //tmp.brandName
        db.child("brand").observeSingleEvent(of: .value) { snapshot in
//            print(snapshot.value)
            do{
                let data = try JSONSerialization.data(withJSONObject: snapshot.value!, options: [])
                
                let decoder = JSONDecoder()
                
                let brands: [Brand] = try decoder.decode([Brand].self, from: data)
//                let reference = storageRef.child(
//                print("----> customers: \(customers.count)")
                tmp.brandName = brands[index].brandName
                tmp.cars = brands[index].cars
//                tmp.imgAddress = brands[index].imgAddress
//                tmp.image = UIImage(named: <#T##String#>)
                completion(tmp)
            } catch let error {
//                print("error----:  \(error.localizedDescription)")
                print(error)
            }
        }
    
    }
}


struct Brand: Codable{
    
    var brandName: String
    var cars: [BrandCarModels]
//    var imgAddress: String
    //var image: [UIImage]
    
    enum CodingKeys : String, CodingKey{
        case brandName = "name"
        
        case cars = "cars"
        
//        case imgAddress = "url"
    }
    
    
    init() {
        self.brandName = " "
        self.cars = []
//        self.imgAddress = " "
    }

    var toDictionary:[String:Any] {
        let carsArray = cars.map{ $0.toDictionary }
        let dict: [String:Any] = ["brandName" : brandName, "cars" : carsArray]
        return dict
    }
}


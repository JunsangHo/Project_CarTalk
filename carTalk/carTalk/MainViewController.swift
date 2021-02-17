//
//  ViewController.swift
//  carTalk
//
//  Created by 용상호 and 권준상 on 2021/02/13.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var menuButton: UIButton! // 상위 메뉴 버튼
    @IBOutlet weak var searchButton: UIButton! // 상위 검색 버튼
    
    // 데이터 전송 준비
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBrandDetail" {
            let vc = segue.destination as? BrandViewController
            if let index = sender as? Int {
                let brandname = viewModel.getName(index: index)
                vc?.viewModel.setName(model: brandname)
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
        performSegue(withIdentifier: "showBrandDetail", sender: indexPath.item)
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
        case "hyundai":
            brandLabel.text = "현대"
        case "kia":
            brandLabel.text = "기아"
        case "chevrolet":
            brandLabel.text = "쉐보레"
        case "renault":
            brandLabel.text = "르노삼성"
        case "ssangyong":
            brandLabel.text = "쌍용"
        default:
            brandLabel.text = "오류"
        }
    }
}

class MainViewModel {
    let brandList: [BrandInfo] = [
        BrandInfo(brandName: "hyundai"),
        BrandInfo(brandName: "kia"),
        BrandInfo(brandName: "chevrolet"),
        BrandInfo(brandName: "renault"),
        BrandInfo(brandName: "ssangyong"),
    ]
    
    var numOfitem: Int {
        return brandList.count
    }
    
    func getInfo(index: Int) -> BrandInfo {
        return brandList[index]
    }
    
    func getName(index: Int) -> String {
        return brandList[index].brandName
    }
}


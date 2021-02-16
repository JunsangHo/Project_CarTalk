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
    
    // 더 해야할 것 -> ViewModel 과 Brand 들을 저장할 struct 필요, 브랜드 지정
    
    // 몇개의 셀 사용할 것인지?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 //임시
    }
    
    // 셀을 어떻게 구성할 것인지?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCell", for: indexPath) as? BrandCell else {
            return UICollectionViewCell()
        }
        //code
        return cell
    }
    
    // 셀의 레이아웃을 어떻게 설정할 것인지?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemspacing: CGFloat = 3
        let textAreaHeight: CGFloat = 10
        let width: CGFloat = (collectionView.bounds.width/6)-itemspacing*6
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
    
//    func updateUI(brandInfo: BrandInfo) {
//        brandImage.image = BrandInfo.img
//        brandLabel.text = BrandInfo.name
//    }
}

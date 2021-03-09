//
//  SpecificationViewController.swift
//  carTalk
//
//  Created by 권준상 on 2021/03/01.
//

import UIKit
// hello hello helllllllo

class SpecificationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    let viewModel = specificationViewModel()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpecificationCell", for: indexPath) as? SpecificationCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

class SpecificationCell: UICollectionViewCell {
    @IBOutlet weak var trimName: UILabel!
    @IBOutlet weak var trimPrice: UILabel!
    @IBOutlet weak var engineType: UILabel!
    @IBOutlet weak var displacement: UILabel!
    @IBOutlet weak var fuelTypeDetail: UILabel!
    
    @IBOutlet weak var maximumPower: UILabel!
    @IBOutlet weak var maximumTorque: UILabel!
    @IBOutlet weak var overallLength: UILabel!
    @IBOutlet weak var overallWidth: UILabel!
    @IBOutlet weak var overallHeight: UILabel!
    
    @IBOutlet weak var wheelBase: UILabel!
    @IBOutlet weak var curbWeight: UILabel!
    @IBOutlet weak var occupancy: UILabel!
    @IBOutlet weak var drivingSystem: UILabel!
    @IBOutlet weak var transmission: UILabel!
    
}

class specificationViewModel {
    func fetchItems() {
        
    }
}

//
//  ModelsViewController.swift
//  carTalk
//
//  Created by 용상호 on 2021/02/24.
//

import UIKit

class ModelsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    var viewModel = ModelsViewModel()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topBrandLogo: UIImageView!
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowModels" {
            let vc = segue.destination as? BrandViewController
            if let temp = sender as? Int {
//                vc?.viewModel.setDetail(temp: temp)
                vc?.viewModel.setModel(model: self.viewModel.brand?.cars[temp])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel.brand?.cars.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "modelCell",for: indexPath) as? ModelCell {
            let tmp = viewModel.brand?.cars[indexPath.row]
            cell.modelName.text = tmp!.name
            

            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "ShowModels", sender: indexPath.row)
//        let tmp = viewModel.brand?.cars[indexPath.row]
//        self.viewModel.getCar(url: tmp!.address, carName: tmp!.name) { temp in
//            self.performSegue(withIdentifier: "showCarDetail", sender: temp)
//        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        topBrandLogo.image = UIImage(named: "\(String(describing: self.viewModel.brand?.brandName))Logo.png")
    }
    


}

class ModelCell: UITableViewCell {
    @IBOutlet weak var modelName: UILabel!
}

class ModelsViewModel {
    var brand: Brand?
    
    func setBrand(model: Brand?){
        brand = model
    }
}

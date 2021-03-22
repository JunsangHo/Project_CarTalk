//
//  SearchViewController.swift
//  carTalk
//
//  Created by 권준상 on 2021/03/22.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    private func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 키보드가 올라와있을때, 내려가게 처리
        dismissKeyboard()
        // 검색어가 있는지
        guard let searchTerm = searchBar.text,
              searchTerm.isEmpty == false else { return }
        
        // 네트워킹을 이용한 검색
        // - 서치텀을 가지고 자동차 결과를 검색
        // - 검색 API 가 필요
        // - 결과를 받아올 모델 Car, Response
        // - 결과를 받아와서, TableView로 표현해주자
        
        SearchAPI.search(searchTerm) { (carinfo) in
            // tableView로 표현하기
        }
        
        print("--->\(searchTerm)")
    }
}

class SearchAPI {
    static func search(_ term: String, completion: @escaping (([DetailCarInfo]) -> Void)) {
        
    }
}

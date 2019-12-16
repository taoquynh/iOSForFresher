//
//  MainScreenViewController.swift
//  ItunesConnect
//
//  Created by Taof on 4/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import Alamofire

class MainScreenViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollection()
        setupSearchBar()
        navigationItem.title = "Music"
    }

    func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
    }
}

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        let item = items[indexPath.row]
        cell.setupCustomCell(item: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let itemSelected = self.items[indexPath.item]
        detailVC.chooseItem = itemSelected
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = ((collectionView.frame.size.width - 1) / 2)
        return CGSize(width: size, height: size + 50)
    }
    
}

extension MainScreenViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchByText(text: searchText)
    }
    
    func searchByText(text: String) {
        let url = String(format: "https://itunes.apple.com/search?term=%@&limit=20", text)
        
        guard let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let urlNew = URL(string: urlString) else {
                return
        }
        
        Alamofire.request(urlNew, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { [unowned self] (response) in
            guard let data = response.data else {
                return
            }
            
            self.items = ResultObject.parseData(data)
            self.collectionView.reloadData()
        }
    }
}

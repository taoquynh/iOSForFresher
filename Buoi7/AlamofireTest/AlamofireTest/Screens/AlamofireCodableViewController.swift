//
//  AlamofireCodableViewController.swift
//  AlamofireTest
//
//  Created by Taof on 12/3/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireCodableViewController: UIViewController {
    deinit {
        print("Huỷ AlamofireCodableViewController")
    }
    
    @IBOutlet weak var tableView: UITableView!
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sử dụng Codable"
        configTableView()
        let url = "http://www.json-generator.com/api/json/get/clcVhGGZgy?indent=2"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { [weak self] (response) in
            print("Response: \(response.result)")
            guard let data = response.data, let strongSelf = self else {
                return
            }

            strongSelf.users = ResultObject.parseData(data)
            strongSelf.tableView.reloadData()
        }
    }
    
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension AlamofireCodableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if (cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = users[indexPath.row].name
        cell?.detailTextLabel?.text = users[indexPath.row].about
        
        return cell!
    }
    
}

//
//  AlamofireObjectMapperViewController.swift
//  AlamofireTest
//
//  Created by Taof on 12/3/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper


class AlamofireObjectMapperViewController: UIViewController {
    
    deinit {
        print("Huỷ AlamofireObjectMapperViewController")
    }
    @IBOutlet weak var tableView: UITableView!
    var persons = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sử dụng Object Mapper"
        configTable()
        let url = "http://www.json-generator.com/api/json/get/clcVhGGZgy?indent=2"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<PersonObject>) in
            let personResponse = response.result.value
            if let res = personResponse?.results {
                self.persons = res
                self.tableView.reloadData()
            }
        }
        
//        Alamofire.request(url).responseJSON { (response) in
//            if let error = response.result.error{
//                debugPrint("error right here \(error)")
//            }
//            guard let data =  response.data else {return}
//            switch (response.result){
//            case .success( let reponseString):
////                print("\(reponseString)")
//
//                let person = PersonObject(JSONString: "\(reponseString)")
//                print(person)
//            case .failure(_):
//                print("loi roi")
//            }
//        }
    }
    
    func configTable(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension AlamofireObjectMapperViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if (cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = persons[indexPath.row].name
        cell?.detailTextLabel?.text = persons[indexPath.row].about
        
        return cell!
    }
}

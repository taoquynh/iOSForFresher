//
//  ViewController.swift
//  TodoList
//
//  Created by Taof on 11/30/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var persons = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createData1))
        
        // đăng kí nhận thông báo
//        NotificationCenter.default.addObserver(self, selector: #selector(notification(_:)), name: .notificationNamePerson, object: nil)
    }
    
    // dùng closure để hứng dữ liệu
    @objc func createData(){
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        // hứng dữ liệu từ closure
        mainVC.passData = { [weak self] data in
            guard let strongSelf = self else { return }
            strongSelf.persons.append(data)
            strongSelf.tableView.reloadData()
        }
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
    // dùng NotificationCenter để nhận dữ liệu
    @objc func createData1(){
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        //b5: gán delegate
        mainVC.myDelegate = self
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
    @objc func notification(_ notification: Notification){
        if let person = notification.object as? Person{
            self.persons.append(person)
            self.tableView.reloadData()
        }
    }
    
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CreateTableViewCell", bundle: nil), forCellReuseIdentifier: "CreateTableViewCell")
    }
}

// b6: viết extension
extension ViewController: MyDelegate{
    func dataDelegate(name: String, address: String) {
        let person = Person(name: name, address: address)
        self.persons.append(person)
        self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreateTableViewCell", for: indexPath) as! CreateTableViewCell
        cell.person = persons[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .default, title: "Edit") { [weak self] (_, _) in
            guard let _self = self else { return }
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            mainVC.person = _self.persons[indexPath.row]
            NotificationCenter.default.addObserver(self, selector: #selector(_self.notification(_:)), name: .notificationNamePerson, object: nil)
//            mainVC.passData = { data in
//                _self.persons[indexPath.row] = data
//                _self.tableView.reloadData()
//
//            }
            _self.navigationController?.pushViewController(mainVC, animated: true)

        }
//        edit.backgroundColor = .blue
        return [edit]
    }
}

//
//  MainViewController.swift
//  TodoList
//
//  Created by Taof on 11/30/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

// B1: Tạo protocol
protocol MyDelegate {
    // B2: tạo method
    func dataDelegate(name: String, address: String)
}

class MainViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var passData: ((Person) -> Void)?
    var person: Person?
    // b3: khai báo delegate
    var myDelegate: MyDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let s = person else { return }
        nameTextField.text = s.name
        addressTextField.text = s.address
        
    }
    
    @IBAction func onSaveData(_ sender: Any) {
        guard let name = nameTextField.text else { return }
        guard let address = addressTextField.text else { return }
        
//        passData?(Person(name: name, address: address))
        let personData = Person(name: name, address: address)
        // Gửi thông báo
//        NotificationCenter.default.post(name: .notificationNamePerson, object: personData)
        
        // b4: truyền dữ liệu
        myDelegate?.dataDelegate(name: name, address: address)
        navigationController?.popViewController(animated: true)
    }
}

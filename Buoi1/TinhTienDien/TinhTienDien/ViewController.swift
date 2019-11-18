//
//  ViewController.swift
//  TinhTienDien
//
//  Created by Taof on 11/18/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tienDienLabel: UILabel!
    
    @IBOutlet weak var nhapSoDienTextField: UITextField!
    
    @IBOutlet weak var tinhTienButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tinhTienButton.layer.cornerRadius = 5
    }
    
    func tinhGiaDien(_ soDien: Float) -> Float {
        if soDien < 0 {
            return 0
        } else if soDien <= 50 {
            return soDien * 1678
        } else if soDien <= 100 {
            return 50 * 1678 + (soDien - 50) * 1734
        } else if soDien <= 200 {
            return 50 * 1678 + 50 * 1734 + (soDien - 100) * 2014
        } else if soDien <= 300 {
            let money = 50 * 1678 + 50 * 1734 + 100 * 2014
            return Float(money) + (soDien - 200.0) * 2536.0
        } else if soDien <= 400 {
            let money = 50 * 1678 + 50 * 1734 + 100 * 2014 + 100 * 2536
            return Float(money) + (soDien - 300.0) * 2834.0
        } else {
            let money = 50 * 1678 + 50 * 1734 + 100 * 2014 + 100 * 2536 + 100 * 2834
            return Float(money) + (soDien - 400.0) * 2927.0
        }
    }
    
    @IBAction func tinhTienDien(_ sender: Any) {
        let soDien = Float(nhapSoDienTextField.text ?? "0")
        let thanhToan = tinhGiaDien(soDien ?? 0.0)
        tienDienLabel.text = "\(thanhToan) vnđ"
    }
}


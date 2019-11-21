//
//  TaxiViewController.swift
//  ExerciseDay01
//
//  Created by Taof on 11/21/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class TaxiViewController: UIViewController {

    @IBOutlet weak var moneyLabelView: UILabel!
    
    @IBOutlet weak var inputKilometresTextView: UITextField!
    
    @IBOutlet weak var paymentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputKilometresTextView.layer.cornerRadius = 8
        paymentButton.layer.cornerRadius = 16
    }
    
    
    @IBAction func onPress(_ sender: Any) {
        let km = Float(inputKilometresTextView.text ?? "0")
        let pay = price(km!)
        moneyLabelView.text = "\(pay) vnđ"
    }
    
    func price(_ km: Float) -> Int {
        switch km {
        case _ where km < 1:
            return 0
        case 1:
            return 5000
        case _ where km <= 31:
            return Int(5000 + (km - 1) * 4000)
        default:
            return Int(5000 + 4000 * 30 + (km - 31) * 3000)
        }
    }

}

//
//  ChangeColorViewController.swift
//  ExerciseDay01
//
//  Created by Taof on 11/21/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ChangeColorViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var changeColorButton: UIButton!
    
    let backgroundColors = [UIColor.systemGreen, UIColor.purple, UIColor.systemIndigo, UIColor.systemTeal, UIColor.systemYellow]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeColorButton.frame.size = CGSize(width: 80, height: 80)
        changeColorButton.center = CGPoint(x: view.center.x, y: view.center.y + 250)
        changeColorButton.layer.cornerRadius = changeColorButton.bounds.width / 2
        changeColorButton.setTitle("Swap", for: .normal)

        colorView.backgroundColor = UIColor.systemGreen
    }

    @IBAction func onChangeColor(_ sender: Any) {
        let newColors = backgroundColors.filter {$0 != colorView.backgroundColor}
        colorView.backgroundColor = newColors.randomElement()
    }

}

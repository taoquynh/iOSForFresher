//
//  ViewController.swift
//  MyProject
//
//  Created by Taof on 11/18/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Họ và tên:"
        nameTextField.placeholder = "Nhập tên của bạn"
        descriptionTextView.text = "Đây là textView"
        
        photoImageView.isUserInteractionEnabled = true
        
        // thêm action cho containerView
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTapContainerView))
        
        containerView.addGestureRecognizer(gesture)
    }
    
    @objc func onTapContainerView(){
        self.view.endEditing(true) // ẩn bàn phím
    }

    @IBAction func onTapButton(_ sender: UIButton) {
        button.setTitleColor(UIColor.red, for: .normal)
    }
    
    @IBAction func onTapImageView(_ sender: UITapGestureRecognizer) {
        print("tap image")
    }
    
    func getText(){
        // cách1:
        if let text = nameTextField.text {
            print(text)
        }
        
        // cách 2
        guard let text1 = nameTextField.text else {
            print("textField nil")
            return
            
        }
        print(text1)
        
        
    }
}


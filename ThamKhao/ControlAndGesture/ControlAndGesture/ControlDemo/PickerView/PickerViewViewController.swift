//
//  PickerViewViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 3/29/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class PickerViewViewController: UIViewController {

    // Khai báo 3 control
    // 1. Label: chọn màu, khi chọn thì set màu cho label
    // 2. TextField: lấy ra tên màu được chọn
    // 3. Picker view
    
    var colors = [Color]()
    let label: UILabel = {
        let label = UILabel()
        
        label.text = "Chọn màu"
        label.frame = CGRect(x: 20, y: 70, width: 100, height: 40)
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let colorTextField: UITextField = {
        let textField = UITextField()
        
        textField.frame = CGRect(x: 20, y: 130, width: 200, height: 40)
        textField.placeholder = "Click here"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        return textField
    }()
    
    let colorPickerView: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    let pickerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupToolBar()
        setupPicker()
        
        title = "Picker View"
        
        let redColor = Color(name: "Red", hex: "#F60000")
        let darkOrangeColor = Color(name: "Dark Orange", hex: "#FF8C00")
        let yellowColor = Color(name: "Canary Yellow", hex: "#FFEE00")
        let greenColor = Color(name: "Screamin' Green", hex: "#4DE94C")
        let azureColor = Color(name: "Brilliant Azure", hex: "#3783FF")
        let violetColor = Color(name: "American Violet", hex: "#4815AA")
        
        colors = [redColor, darkOrangeColor, yellowColor, greenColor, azureColor, violetColor]
        print("colorPickerView \(address(o: colorPickerView))")
    }
    
    func setupLayout() {
        view.addSubview(label)
        view.addSubview(colorTextField)
    }
    
    func setupPicker() {
        colorPickerView.delegate = self
        colorPickerView.dataSource = self
        
        colorTextField.inputView = colorPickerView
    }
    
    func setupToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Chọn", style: .plain, target: self, action: #selector(doneAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let labelPicker = UIBarButtonItem(customView: pickerLabel)
        let cancelButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action: #selector(cancelAction))
        
        toolBar.setItems([cancelButton, spaceButton, labelPicker, spaceButton, doneButton], animated: false)
    }
    
    @objc func doneAction() {
        pickerLabel.text = "cba"
        self.view.endEditing(true)
    }
    
    @objc func cancelAction() {
        self.view.endEditing(true)
    }
    
    func address<T: AnyObject>(o: T) -> Int {
        return unsafeBitCast(o, to: Int.self)
    }
}

extension PickerViewViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            var label: UILabel!
            if let reuseLabel = view as? UILabel {
                label = reuseLabel
            } else {
                label = UILabel()
                label.textAlignment = NSTextAlignment.center
            }
            
            label.textColor = .white
            let color = colors[row]
            label.text = color.name
            label.layer.backgroundColor = UIColor(color.hex).cgColor
            return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == colorPickerView {
        
            print(colors[row].name)
            label.textColor = UIColor(colors[row].hex)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
}

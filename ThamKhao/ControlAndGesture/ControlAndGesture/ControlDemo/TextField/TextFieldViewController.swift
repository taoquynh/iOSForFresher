//
//  TextFieldViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh  on 10/14/18.
//  Copyright © 2018 Tào Quỳnh . All rights reserved.
//

import UIKit

class TextFieldViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextField()
    }

    func setupTextField() {
        textField.delegate = self
    }
    
}

extension TextFieldViewController: UITextFieldDelegate {
    
    // return fasle để không cho phép chỉnh sửa
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // trạng thái phản hồi đầu tiên
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    // return true để cho phép chỉnh sửa dừng lại và từ bỏ trạng thái phản hồi đầu tiên
    // return false để không cho phép phiên chỉnh sửa kết thúc
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // có thể được gọi nếu bị ép buộc ngay cả khi shouldEndEditing return false hoặc kết thúc chỉnh sửa
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    // nếu được gọi, hàm này sẽ xử lý thay hàm textFieldDidEndEditing
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing and reason")
    }
    
    // return false để không thay đổi text
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            print(updatedText)
            
            // chỉ nhập 10 kí tự
            if updatedText.count > 10 {
                return false
            }
        }
        return true
    }
    
    // được gọi khi nhấn nút xoá
    // return false để bỏ qua
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return false
    }
    
    // được gọi khi nhấn phím RETURN
    // return false để bỏ qua
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return false
    }

}








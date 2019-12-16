//
//  TextViewViewController.swift
//  ControlAndGesture
//
//  Created by Tào Quỳnh on 5/15/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class TextViewViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var inputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = """
        What is Lorem Ipsum?
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
        """
        
        inputTextView.delegate = self
        inputTextView.textColor = UIColor.red
        inputTextView.text = "Text here"
    }

}

extension TextViewViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("begin editing")
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("end editing")
    }
}

//
//  ViewController.swift
//  Calculator
//
//  Created by Taof on 10/19/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

enum Operation: String{
    case Divide = "/"
    case Multiply = "*"
    case Subtract = "-"
    case Add = "+"
    case Empty = "Empty"
}

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var currentOperation = Operation.Empty // phép tính hiện tại
    var runningNumber = "" // lưu số được chọn
    var leftValStr = "" // lưu số bên trái biểu thức
    var rightValStr = "" // lưu số bên phải biểu thức
    
    var result: String = "" // trả về kết quả
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func numberPress(_ sender: UIButton) {
        runningNumber += "\(sender.tag)"
        resultLabel.text = runningNumber
    }
    
    @IBAction func clearButton(_ sender: Any) {
        processOperation(operation: Operation.Empty)
        runningNumber = "0"
        resultLabel.text = "0"
        result = "0"
    }
    
    @IBAction func addButton(_ sender: Any) {
        processOperation(operation: Operation.Add)
    }
    
    @IBAction func subtractButton(_ sender: Any) {
        processOperation(operation: Operation.Subtract)
    }
    
    @IBAction func multiButton(_ sender: Any) {
        processOperation(operation: Operation.Multiply)
    }
    
    @IBAction func devisionButton(_ sender: Any) {
        processOperation(operation: Operation.Divide)
    }
    
    @IBAction func equalButton(_ sender: Any) {
        
        processOperation(operation: currentOperation)
    }
    
    
    func processOperation(operation: Operation){
        if currentOperation != Operation.Empty{
            // Check if user press twice an operator
            if runningNumber != ""{
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply{
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }else if currentOperation == Operation.Divide{
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }else if currentOperation == Operation.Subtract{
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }else if currentOperation == Operation.Add{
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                resultLabel.text = result
            }
        }else{
            // First time click on operator
            leftValStr = runningNumber
            runningNumber = ""
        }
        currentOperation = operation
    }
}


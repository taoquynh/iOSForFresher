//
//  SemaphoreVC.swift
//  GrandCentralDispatch
//
//  Created by Techmaster on 5/14/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class SemaphoreVC: UIViewController {

    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var v5: UIView!
    @IBOutlet weak var v6: UIView!
    @IBOutlet weak var v7: UIView!
    @IBOutlet weak var v8: UIView!
    @IBOutlet weak var v9: UIView!
    var squares: [UIView]!
    
    let queue = DispatchQueue(label: "com.test.api", qos: .background, attributes: .concurrent)
    var semaphore: DispatchSemaphore!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var btnStart: UIButton!
    var oldColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        squares = [v1, v2, v3, v4, v5, v6, v7, v8, v9]
        oldColor = v1.backgroundColor
    }
    @IBAction func onSliderChange(_ sender: UISlider) {
        let value = floor(sender.value)
        sender.setValue(value, animated: true)
        btnStart.setTitle("Start \(Int(value)) tasks", for: .normal)
        
    }
    @IBAction func onStartSemaphoreTasks(_ sender: Any) {
        let value = Int(floor(slider.value))
        semaphore = DispatchSemaphore(value: value)
        for i in 0..<squares.count {
            queue.async {
                self.semaphore.wait()
                DispatchQueue.main.async {
                    self.squares[i].backgroundColor = UIColor.red
                }
                Thread.sleep(forTimeInterval: Double.random(in: 0.1...1.0))
                
                self.semaphore.signal()
                DispatchQueue.main.async {
                    self.squares[i].backgroundColor = self.oldColor
                }
            }
        }
    }
    


}

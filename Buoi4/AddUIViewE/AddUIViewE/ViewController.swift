//
//  ViewController.swift
//  AddUIViewE
//
//  Created by Tào Quỳnh on 3/19/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myView = UIView()
    var sliderWidth = UISlider()
    var sliderRotate = UISlider()
    var sliderRadius = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
    }

    func addView() {
        // add View
        self.view.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
        myView = UIView(frame: CGRect(x: 30, y: 0, width: 100, height: 100))
        myView.backgroundColor = UIColor.white
        self.view.addSubview(myView)
        myView.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 130)
        
        //add sliderWidth
        sliderWidth = UISlider(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        self.view.addSubview(sliderWidth)
        sliderWidth.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        sliderWidth.addTarget(self, action: #selector(ViewController.onSliderWidthChange(sender:)), for: UIControl.Event.valueChanged)
        sliderWidth.value = 0.5

        // add sliderRadius
        sliderRadius = UISlider(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        self.view.addSubview(sliderRadius)
        sliderRadius.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 80)
        sliderRadius.addTarget(self, action: #selector(ViewController.onSliderRadiusChange(sender:)), for: UIControl.Event.valueChanged)
        sliderRadius.value = 0
        
        // add sliderRotate
        sliderRotate = UISlider(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        self.view.addSubview(sliderRotate)
        sliderRotate.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 160)
        sliderRotate.addTarget(self, action: #selector(ViewController.onSliderRotateChange(sender:)), for: UIControl.Event.valueChanged)
        sliderRotate.value = 0
    }

        @IBAction func onSliderWidthChange(sender: UISlider) {
        myView.transform = CGAffineTransform(scaleX: CGFloat(sliderWidth.value * 2.0), y: CGFloat(sliderWidth.value * 2.0))
    }
    
        @IBAction func onSliderRotateChange(sender: UISlider) {
            myView.transform = CGAffineTransform(rotationAngle: CGFloat(sliderRotate.value * 10))
        }
    
        @IBAction func onSliderRadiusChange(sender: UISlider) {
            myView.layer.cornerRadius = CGFloat(sliderRadius.value * Float(myView.frame.size.height/2))
        }
}


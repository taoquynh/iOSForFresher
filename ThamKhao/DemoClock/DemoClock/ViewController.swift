//
//  ViewController.swift
//  DemoClock
//
//  Created by LIRPA21 on 4/27/19.
//  Copyright © 2019 LIRPA21. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var kimGioView: UIView!
    
    @IBOutlet weak var kimPhutView: UIView!
    
    @IBOutlet weak var kimGiayView: UIView!
    
    var timerClock: Timer!
    
    let omegaSecond = Double.pi*2/60
    let omegaMinute = Double.pi*2/60/60
    let omegaHour = Double.pi*2/12/60/60

    let currentDate = NSDate()
    let calendar = NSCalendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dongHo()
    }
    
    // layoutSubviews: dựng lại layout khi có tác động
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height{
            dongHo()
        } else {
            dongHo()
        }
    }
    
    func dongHo(){
        setLocationKimDongHo(kimView: kimGioView, angle: setTime().hour)
        setLocationKimDongHo(kimView: kimPhutView, angle: setTime().minute)
        setLocationKimDongHo(kimView: kimGiayView, angle: setTime().second)
        
        timerClock = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runClock), userInfo: nil, repeats: true)
    }
    
    func setTime() -> (hour: CGFloat, minute: CGFloat, second: CGFloat){
        let hour = calendar.component(.hour, from: currentDate as Date)
        let minute = calendar.component(.minute, from: currentDate as Date)
        let second = calendar.component(.second, from: currentDate as Date)
        
        let hourInSecond = hour*60*60 + minute*60 + second
        let minuteInSecond = minute*60 + second
        
        let firstAlphaHour = CGFloat(Double.pi)*(2*CGFloat(hourInSecond)/12/60/60 - 0.5)
        let firstAlphaMinute = CGFloat(Double.pi)*(2*CGFloat(minuteInSecond)/60/60 - 0.5)
        let firstAlphaSecond = CGFloat(Double.pi)*(2*CGFloat(second)/60 - 0.5)
        
        return (firstAlphaHour, firstAlphaMinute, firstAlphaSecond)
    }
    
    func setLocationKimDongHo(kimView: UIView, angle: CGFloat) {
        let r = kimView.bounds.size.height/2
        kimView.center = CGPoint(x: view.center.x, y: view.center.y)
        kimView.layer.cornerRadius = r
        
        setAnchorPoint(aView: kimView, point: CGPoint(x: kimView.bounds.height/2/kimView.bounds.width, y: 0.5))
        
//        Quay goc ban dau
        kimView.transform = CGAffineTransform.init(rotationAngle: angle)
        
    }
    
    @objc func runClock() {
       
        let omegaGiay = CGAffineTransform(rotationAngle: CGFloat(Double.pi*2/60))
        kimGiayView.transform = kimGiayView.transform.concatenating(omegaGiay)
        
        let omegaPhut = CGAffineTransform(rotationAngle: CGFloat(Double.pi*2/60/60))
        kimPhutView.transform = kimPhutView.transform.concatenating(omegaPhut)
        
        let omegaGio = CGAffineTransform(rotationAngle: CGFloat(Double.pi*2/60/60/12))
        kimGioView.transform = kimGioView.transform.concatenating(omegaGio)
    }
    
    func setAnchorPoint(aView: UIView, point: CGPoint) {
        var newPoint = CGPoint(x: aView.bounds.size.width * point.x, y: aView.bounds.size.height * point.y)
        var oldPoint = CGPoint(x: aView.bounds.size.width * aView.layer.anchorPoint.x, y: aView.bounds.size.height * aView.layer.anchorPoint.y);
        
        newPoint = newPoint.applying(aView.transform)
        oldPoint = oldPoint.applying(aView.transform)
        
        var position = aView.layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        aView.layer.position = position
        aView.layer.anchorPoint = point
    }
}


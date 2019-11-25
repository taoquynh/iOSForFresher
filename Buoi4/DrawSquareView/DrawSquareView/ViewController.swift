//
//  ViewController.swift
//  DrawSquareView
//
//  Created by Taof on 8/16/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var containerView = UIView()
    var width: CGFloat = 0
    var squareWidth: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = self.view.frame.width
        containerView.frame = CGRect(x: 0, y: 0, width: width, height: width)
        containerView.center = view.center
        containerView.backgroundColor = UIColor.gray
        view.addSubview(containerView)
        
        squareWidth = (containerView.bounds.width) / 6
        drawWall()
    }
    
    func drawI(){
        for i in 0...2{
            if i == 1 {
                for j in 0...2 {
                    drawSquare(col: i, row: j, radius: squareWidth, color: UIColor.orange)
                }
            }
        }
    }
    
    func drawL(){
        for i in 0...2{
            if i == 0 {
                for j in 0...2 {
                    drawSquare(col: i, row: j, radius: squareWidth, color: UIColor.orange)
                }
            }else if i == 1 {
                drawSquare(col: i, row: 2, radius: squareWidth, color: UIColor.orange)
            }
        }
    }
    
    let arrColors = [UIColor.red, UIColor.orange, UIColor.green, UIColor.purple, UIColor.blue, UIColor.magenta, UIColor.brown, UIColor.cyan]
    func drawWall(){
        for i in 0...2{
            for j in 0...2{
                let randomColor = arrColors.randomElement()
                drawSquare(col: i, row: j, radius: squareWidth, color: randomColor ?? UIColor.gray)
            }
        }
    }
    func drawSquare(col: Int, row: Int, radius: CGFloat, color: UIColor) {
        let d = radius * 2
        let ball = SquareView(center: CGPoint(x: d * CGFloat(col), y: d * CGFloat(row)), radius: radius, fillColor: color)
        containerView.addSubview(ball)
    }
}

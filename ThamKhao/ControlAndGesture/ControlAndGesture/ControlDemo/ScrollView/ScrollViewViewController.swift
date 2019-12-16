//
//  ScrollViewViewController.swift
//  ControlAndGesture
//
//  Created by Tào Quỳnh on 5/15/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ScrollViewViewController: UIViewController, UIScrollViewDelegate {

    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return scroll
    }()
    
    var arrays = [UIImage]()
    var brrays = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        arrays = [UIImage(named: "1"),
                  UIImage(named: "2"),
                  UIImage(named: "3"),
                  UIImage(named: "4"),
                  UIImage(named: "5"),
                  UIImage(named: "baby")] as! [UIImage]
        
        view.addSubview(scrollView)
        setupImage(arrays)
    }
    
    func setupImage(_ images: [UIImage]){
        for i in 0..<arrays.count{
            let imageView = UIImageView()
            let xPosition = UIScreen.main.bounds.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            imageView.contentMode = .scaleAspectFit
            imageView.image = images[i]
            
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i+1)
            
            //            let yPosition = UIScreen.main.bounds.height * CGFloat(i)
            //            imageView.frame = CGRect(x: 0, y: yPosition, width: scrollView.frame.width, height: scrollView.frame.height)
            //            scrollView.contentSize.height = scrollView.frame.height * CGFloat(i+1)
            scrollView.addSubview(imageView)
            scrollView.delegate = self
        }
    }
    
}

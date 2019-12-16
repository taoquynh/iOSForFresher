//
//  ViewImage.swift
//  ShowListImage
//
//  Created by Taof on 12/6/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

struct Name {
    var image: String
    var label: String
}

class CustomView: UIView {
    
    var imageView = UIImageView()
    var nameLabel = UILabel()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.width)
        nameLabel.frame = CGRect(x: 0, y: 30, width: self.bounds.size.width, height: self.bounds.size.width)
        
        self.addSubview(imageView)
        self.addSubview(nameLabel)
        
        nameLabel.textAlignment = .center
        nameLabel.font = .boldSystemFont(ofSize: 40)
//        nameLabel.center.y = center.y + 250
        nameLabel.textColor = .black
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.red.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func draw(_ rect: CGRect) {
//    }
}

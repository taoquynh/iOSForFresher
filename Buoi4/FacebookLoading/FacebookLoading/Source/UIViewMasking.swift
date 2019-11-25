//
//  UIViewMasking.swift
//  FacebookLoading
//
//  Created by Taof on 3/28/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

extension UIView {
    func setMaskingViews(_ views: [UIView]) {
        let mutablePath = CGMutablePath()
        
        //Append path for each subview
        views.forEach { (view) in
            guard self.subviews.contains(view) else{
                fatalError("View:\(view) is not a subView of \(self). Therefore, it cannot be a masking view.")
            }
            //Check if ellipse
            if view.layer.cornerRadius == view.frame.size.height / 2, view.layer.masksToBounds{
                //Ellipse
                mutablePath.addEllipse(in: view.frame)
            }else{
                //Rect
                mutablePath.addRect(view.frame)
            }
        }
        
        //Create layer
        let maskLayer = CAShapeLayer()
        maskLayer.path = mutablePath
        
        //Apply layer as a mask
        self.layer.mask = maskLayer
    }
}

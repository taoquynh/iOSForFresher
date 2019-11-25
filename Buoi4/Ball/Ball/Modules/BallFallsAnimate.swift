//
//  BallFallsAnimate.swift
//  Ball
//
//  Created by Taof on 6/1/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class BallFallsAnimate: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let y = self.ballImageView.frame.origin.y
        // bóng rơi từ độ cao y
        UIView.animate(withDuration: 2) {
            self.ballImageView.frame.origin.y += self.view.bounds.height - y - self.ballImageView.bounds.height
        }
        
        // bóng rơi từ độ cao y và nảy lên vị trí ban đầu
//        UIView.animate(withDuration: 2, animations: {
//                    self.ballImageView.frame.origin.y += self.view.bounds.height - y - self.ballImageView.bounds.height
//                }) { _ in
//                    UIView.animate(withDuration: 2, delay: 0.5, options: [], animations: {
//                        self.ballImageView.frame.origin.y -= self.view.bounds.height - y - self.ballImageView.bounds.height
//                    })
//                }
        
        // bóng rơi lặp đi lặp lại từ độ cao y và nảy lên
//        UIView.animate(withDuration: 2, animations: {
//            self.ballImageView.frame.origin.y += self.view.bounds.height - y - self.ballImageView.bounds.height
//        }) {_ in
//            UIView.animateKeyframes(withDuration: 2, delay: 0.5, options: [.autoreverse, .repeat], animations: {
//                self.ballImageView.frame.origin.y -= self.view.bounds.height - y - self.ballImageView.bounds.height
//            })
//        }
        
//

    }

}

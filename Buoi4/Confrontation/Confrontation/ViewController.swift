//
//  ViewController.swift
//  Confrontation
//
//  Created by Taof on 11/13/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var uaeImageView: UIImageView!
    @IBOutlet weak var vietnamImageView: UIImageView!
    @IBOutlet weak var uaeScoreLabel: UILabel!
    @IBOutlet weak var vietnamScoreLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var topLineConst: NSLayoutConstraint!
    @IBOutlet weak var bottomLineConst: NSLayoutConstraint!
    @IBOutlet weak var uaeHeightConst: NSLayoutConstraint!
    @IBOutlet weak var vietnamHeightConst: NSLayoutConstraint!
    
    //tỷ số trận đấu
    var topScore = 0 {
        didSet {
            uaeScoreLabel.text = "\(topScore)"
        }
    }
    
    var bottomScore = 0 {
        didSet {
            vietnamScoreLabel.text = "\(bottomScore)"
        }
    }
    
    let maxScore = 20
    var gameOn = false // trạng thái của game
    var padding: CGFloat = 70 {
        didSet {
            guard view != nil else { return }
            topLineConst.constant = padding
            bottomLineConst.constant = padding
        }
    }
    
    var score = 0 {
        didSet {
            guard let viewHeight = view?.frame.height else {
                return
            }
            let availableSpace: CGFloat = viewHeight - 2 * padding
            
            uaeHeightConst.constant =
                max(min(viewHeight, CGFloat(score) / CGFloat(maxScore) * availableSpace + padding), 0)
            
            vietnamHeightConst.constant =
                max(min(viewHeight, CGFloat(maxScore - score) / CGFloat(maxScore) * availableSpace + padding), 0)
            
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: UIView.AnimationOptions.allowUserInteraction,
                           animations: {
                            self.view.layoutIfNeeded()
            },
                           completion: nil)
        }
    }
    
    var bombSoundEffect: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        padding = 70
        
        //đặt 2 hướng người chơi
        let rotate = CGAffineTransform(rotationAngle: CGFloat.pi)
        self.uaeScoreLabel.transform = rotate
        
        //thiết lập lại điểm số
        topScore = 0
        bottomScore = 0
        
        uaeImageView.isUserInteractionEnabled = true
        vietnamImageView.isUserInteractionEnabled = true
        
        newGame()
    }
    
    func newGame() {
        //thiết lập lại điểm số
        score = maxScore / 2
        
        //hiển thị điểm số và mờ dần
        uaeScoreLabel.alpha = 1
        vietnamScoreLabel.alpha = 1
        UIView.animate(withDuration: 2, animations: {
            self.uaeScoreLabel.alpha = 0
            self.vietnamScoreLabel.alpha = 0
        })
        
        // đếm ngược
        let stepTime: TimeInterval = 1.0
        self.countdownLabel.alpha = 1
        self.countdownLabel.text = "3"
        self.soundPlay("counter2.caf")
        UIView.animate(withDuration: stepTime,
                       animations: {
                        self.countdownLabel.alpha = 0
        }, completion: { _ in
            self.countdownLabel.text = "2"
            self.countdownLabel.alpha = 1
            self.soundPlay("counter2.caf")
            
            UIView.animate(withDuration: stepTime,
                           animations: {
                            self.countdownLabel.alpha = 0
            }, completion: { _ in
                self.countdownLabel.text = "1"
                self.countdownLabel.alpha = 1
                self.soundPlay("counter2.caf")
                
                UIView.animate(withDuration: stepTime,
                               animations: {
                                self.countdownLabel.alpha = 0
                }, completion: { _ in
                    self.countdownLabel.text = "GO"
                    self.countdownLabel.alpha = 1
                    self.soundPlay("counter2.caf")
                    
                    UIView.animate(withDuration: stepTime,
                                   animations: {
                                    self.countdownLabel.alpha = 0
                    }, completion: { _ in
                        self.gameOn = true
                    })
                })
            })
        })
    }
    
    func soundPlay(_ name: String){
        let path = Bundle.main.path(forResource: name, ofType: nil)
        let url = URL(fileURLWithPath: path ?? "")
        
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    func getRandomClash() -> Int {
        let diceRoll = Int(arc4random_uniform(UInt32(5)))
        return 4 + diceRoll
    }
    
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        guard let sender = sender.view else { return }
        
        if sender.tag == 1 {
            score += 1
        } else if sender.tag == 2 {
            score -= 1
        }
        
        soundPlay("counter1.caf")
        
        //kiểm tra xem nếu uae thắng
        if score > maxScore {
            topScore += 1
            gameOn = false
            newGame()
        }
        
        //kiểm tra nếu việt nam thắng
        if score < 0 {
            bottomScore += 1
            gameOn = false
            newGame()
        }
    }
    
    //MARK: - Huỷ ViewController
    deinit {
        bombSoundEffect?.pause()
    }
}


//
//  PlayerViewController.swift
//  ItunesConnect
//
//  Created by Taof on 4/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artisNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    
    var chooseItem: Result?
    var playerItem: AVPlayerItem?
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Player"
        if let chooseItem = chooseItem {
            trackNameLabel.text = "\(chooseItem.trackName ?? "")"
            artisNameLabel.text = "\(chooseItem.artistName ?? "")"
            
            guard let videoURL = URL(string: chooseItem.previewUrl ?? "") else {
                return
            }
            
            player = AVPlayer(url: videoURL)
            let playerLayer = AVPlayerLayer(player: player)
            let deviceSize = UIScreen.main.bounds.size
            let playerSize: CGFloat = 300
            playerLayer.backgroundColor = UIColor.black.cgColor
            playerLayer.frame = CGRect(x: (deviceSize.width - playerSize)/2, y: 130, width: playerSize, height: playerSize)
            self.view.layer.addSublayer(playerLayer)
            player?.play()
            
            player?.addPeriodicTimeObserver(forInterval: CMTimeMake(value: 1, timescale: 1), queue: DispatchQueue.main, using: { (time) in
                if self.player?.currentItem?.status == .readyToPlay {
                    let time: Float64 = CMTimeGetSeconds((self.player?.currentTime())!)
                    self.slider.value = Float(time)
                }
            })
            
            let playerItem = AVPlayerItem(url: videoURL)
            slider.minimumValue = 0
            let duration: CMTime = playerItem.asset.duration
            let seconds: Float64 = CMTimeGetSeconds(duration)
            slider.maximumValue = Float(seconds)
            playButton.setImage(UIImage(named: "Pause"), for: .normal)
            
            setupNavigationItem()
        }
    }
    
    func setupNavigationItem() {
        
        let btnBack = UIBarButtonItem(image: UIImage(named: "ic_chevron_left"), style: .done, target: self, action: #selector(PlayerViewController.back))
        navigationItem.leftBarButtonItem = btnBack
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: Selector(("finishedPlaying")), name: NSNotification.Name.AVPlayerItemFailedToPlayToEndTime, object: playerItem)
        
    }
    
    @objc func back() {
        player?.pause()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func finishedPlaying(_ notification: Notification) {
        playButton.setImage(UIImage(named: "Play"), for: .normal)
        if let stopedPlayerItem: AVPlayerItem = notification.object as? AVPlayerItem {
            stopedPlayerItem.seek(to: CMTime.zero) { (isFinished) in
                return
            }
        }
        
    }

    @IBAction func onPress(_ sender: UIButton) {
        if player == nil {
            return
        }
        
        if player!.rate > 0 {
            player?.pause()
//            sender.setBackgroundImage(UIImage(named: "Play"), for: .normal)
            playButton.setImage(UIImage(named: "Play"), for: .normal)
        } else {
            player?.play()
//            sender.setBackgroundImage(UIImage(named: "Pause"), for: .normal)
            playButton.setImage(UIImage(named: "Pause"), for: .normal)
        }
    }
    
    @IBAction func slider(_ sender: UISlider) {
        let seconds: Int64 = Int64(slider.value)
        let targetTime:CMTime = CMTimeMake(value: seconds, timescale: 1)
        guard let player = player else {
            return
        }
        
        player.seek(to: targetTime, completionHandler: {_ in
            
        })
        if player.rate == 0
        {
            player.play()
        }
    }
    
}

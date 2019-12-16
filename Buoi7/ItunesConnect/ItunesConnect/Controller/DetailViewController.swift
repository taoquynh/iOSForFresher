//
//  DetailViewController.swift
//  ItunesConnect
//
//  Created by Taof on 4/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackPriceLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    var chooseItem: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playButton.layer.cornerRadius = 10
        if let chooseItem = chooseItem {
            
            photoImageView.kf.setImage(with: URL(string: chooseItem.artworkUrl100 ?? ""))
            trackNameLabel.text = "TrackName: \(chooseItem.trackName ?? "")"
            artistNameLabel.text = "ArtisName: \(chooseItem.artistName ?? "")"
            let formatPrice = NumberFormatter()
            formatPrice.numberStyle = .decimal
            
            if let trackPrice  = chooseItem.trackPrice as NSNumber? {
                trackPriceLabel.text = "Price: " + formatPrice.string(from: trackPrice)! + "$"
            }
            countryLabel.text = "Country: \(chooseItem.country ?? "")"
            typeLabel.text = "Type: \(chooseItem.type ?? "")"
            navigationItem.title = chooseItem.primaryGenreName
            
        }
        setupNavigationItem()
    }
    
    func setupNavigationItem() {
        
        let btnBack = UIBarButtonItem(image: UIImage(named: "ic_chevron_left"), style: .done, target: self, action: #selector(DetailViewController.back))
        navigationItem.leftBarButtonItem = btnBack
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onPress(_ sender: UIButton) {
        
        let playerVC = PlayerViewController()
        playerVC.chooseItem = chooseItem
        navigationController?.pushViewController(playerVC, animated: true)
    }
}

//
//  CustomCollectionViewCell.swift
//  ItunesConnect
//
//  Created by Taof on 4/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import Kingfisher
class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCustomCell(item: Result) {
        
        let url = URL(string: item.artworkUrl100 ?? "")
        photoImageView.kf.setImage(with: url)
        
        //imageView.image = UIImage(named: item.artworkUrl100!)
        trackNameLabel.text = item.trackName
        artistNameLabel.text = item.artistName
    }
}

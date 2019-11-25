//
//  ViewController.swift
//  FacebookLoading
//
//  Created by Taof on 3/28/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var skeletonView: SkeletonView!
    
    @IBOutlet weak var profileImageViewPlaceholder: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet var maskingViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        setupCardView()
        setupProfileImage()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.skeletonView.setMaskingViews(self.maskingViews)
    }
    func setupLabels() {
        self.nameLabel.alpha = 0.0
        self.jobTitleLabel.alpha = 0.0
        self.locationLabel.alpha = 0.0
    }
    
    func setupCardView() {
        self.cardView.layer.cornerRadius = 14.0
        self.cardView.layer.shadowColor = UIColor.darkGray.cgColor
        self.cardView.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        self.cardView.layer.shadowRadius = 6.0
        self.cardView.layer.shadowOpacity = 0.6
    }
    
    func setupProfileImage() {
        self.profileImageView.layer.masksToBounds = true
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.height/2
        
        self.profileImageViewPlaceholder.layer.masksToBounds = true
        self.profileImageViewPlaceholder.layer.cornerRadius = self.profileImageViewPlaceholder.frame.size.height/2
    }

    @IBAction func loadingProfilePressed(_ sender: UIButton) {
        //Start animating skeleton view
        self.skeletonView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            
            //Set text to labels
            self.nameLabel.text = "Hello"
            self.jobTitleLabel.text = "I am iOS Developer"
            self.locationLabel.text = "Good day!"
            
            //Stop animating skeleton view
            self.skeletonView.stopAnimating()
            
            //Remove skeleton view's mask
            self.skeletonView.layer.mask = nil
            
            //Animate content fade in
            UIView.animate(withDuration: 0.1, animations: {
                self.nameLabel.alpha = 1.0
                self.jobTitleLabel.alpha = 1.0
                self.locationLabel.alpha = 1.0
                self.profileImageView.image = UIImage(named: "Ga")
            })
        }
    }
    
}


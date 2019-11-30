//
//  CreateTableViewCell.swift
//  TodoList
//
//  Created by Taof on 11/30/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class CreateTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var person: Person? {
        didSet{
            if let person = person {
                nameLabel.text = person.name
                addressLabel.text = person.address
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

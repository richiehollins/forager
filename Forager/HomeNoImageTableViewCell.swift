//
//  HomeNoImageTableViewCell.swift
//  Forager
//
//  Created by Hollins, Richie on 5/6/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class HomeNoImageTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var feedsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var theCard: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        theCard.layer.cornerRadius = 10
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
